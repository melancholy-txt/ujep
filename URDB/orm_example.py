# ORM Example - SQLAlchemy s F1 databází

import os

from sqlalchemy import create_engine, Column, Integer, String, Boolean, Date, ForeignKey, DECIMAL, Text, Enum
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

# ============================================
# KONFIGURACE PŘIPOJENÍ
# ============================================

# Připojení k MySQL/MariaDB databázi
# mysql+pymysql://user:password@host:port/database

# DB_USER = os.getenv("DB_USER", "root")
# DB_PASSWORD = os.getenv("DB_PASSWORD", "password")

# DB_USER = os.getenv("DB_USER", "f1_viewer")
# DB_PASSWORD = os.getenv("DB_PASSWORD", "heslo123")     
#  
DB_USER = os.getenv("DB_USER", "f1_editor")
DB_PASSWORD = os.getenv("DB_PASSWORD", "heslo456")

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "3306")
DB_NAME = os.getenv("DB_NAME", "f1_database")

DATABASE_URL = f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

engine = create_engine(DATABASE_URL, echo=True)  # echo=True pro logování SQL
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()

# DEFINICE MODELŮ

class Country(Base):
    """Model pro tabulku countries"""
    __tablename__ = 'countries'
    
    country_id = Column(Integer, primary_key=True, autoincrement=True)
    country_name = Column(String(100), unique=True, nullable=False)
    country_code = Column(String(3), unique=True, nullable=False)
    continent = Column(String(50), nullable=False)
    
    # Relace
    drivers = relationship("Driver", back_populates="country")
    
    def __repr__(self):
        return f"<Country(name='{self.country_name}', code='{self.country_code}')>"


class Driver(Base):
    """Model pro tabulku drivers"""
    __tablename__ = 'drivers'
    
    driver_id = Column(Integer, primary_key=True, autoincrement=True)
    first_name = Column(String(50), nullable=False)
    last_name = Column(String(50), nullable=False)
    country_id = Column(Integer, ForeignKey('countries.country_id'), nullable=False)
    date_of_birth = Column(Date, nullable=False)
    driver_number = Column(Integer)
    championships_won = Column(Integer, default=0)
    career_starts = Column(Integer, default=0)
    career_wins = Column(Integer, default=0)
    career_podiums = Column(Integer, default=0)
    career_points = Column(DECIMAL(5, 1), default=0)
    is_active = Column(Boolean, default=True)
    
    # Relace
    country = relationship("Country", back_populates="drivers")
    race_results = relationship("RaceResult", back_populates="driver")
    
    @property
    def full_name(self):
        return f"{self.first_name} {self.last_name}"
    
    def __repr__(self):
        return f"<Driver(name='{self.full_name}', number={self.driver_number})>"


class Team(Base):
    """Model pro tabulku teams"""
    __tablename__ = 'teams'
    
    team_id = Column(Integer, primary_key=True, autoincrement=True)
    team_name = Column(String(100), unique=True, nullable=False)
    full_name = Column(String(150))
    base_location = Column(String(100))
    principal_id = Column(Integer, ForeignKey('team_principals.principal_id'))
    founded_year = Column(Integer)
    championships_won = Column(Integer, default=0)
    total_wins = Column(Integer, default=0)
    total_podiums = Column(Integer, default=0)
    total_points = Column(DECIMAL(5, 1), default=0)
    is_active = Column(Boolean, default=True)
    team_color = Column(String(7))
    
    # Relace
    principal = relationship("TeamPrincipal", back_populates="team")
    
    def __repr__(self):
        return f"<Team(name='{self.team_name}')>"


class TeamPrincipal(Base):
    """Model pro tabulku team_principals s rekurzivní relací"""
    __tablename__ = 'team_principals'
    
    principal_id = Column(Integer, primary_key=True, autoincrement=True)
    first_name = Column(String(50), nullable=False)
    last_name = Column(String(50), nullable=False)
    country_id = Column(Integer, ForeignKey('countries.country_id'), nullable=False)
    years_of_experience = Column(Integer, default=0)
    previous_teams = Column(Text)
    mentor_principal_id = Column(Integer, ForeignKey('team_principals.principal_id'))  # Rekurzivní FK
    is_active = Column(Boolean, default=True)
    
    # Rekurzivní relace - mentor
    mentor = relationship("TeamPrincipal", remote_side=[principal_id], backref="mentees")
    team = relationship("Team", back_populates="principal", uselist=False)
    
    @property
    def full_name(self):
        return f"{self.first_name} {self.last_name}"
    
    def __repr__(self):
        return f"<TeamPrincipal(name='{self.full_name}')>"


class RaceResult(Base):
    """Model pro tabulku race_results"""
    __tablename__ = 'race_results'
    
    result_id = Column(Integer, primary_key=True, autoincrement=True)
    race_id = Column(Integer, ForeignKey('races.race_id'), nullable=False)
    driver_id = Column(Integer, ForeignKey('drivers.driver_id'), nullable=False)
    starting_position = Column(Integer, nullable=False)
    finishing_position = Column(Integer)
    points_earned = Column(DECIMAL(4, 1), default=0)
    laps_completed = Column(Integer, nullable=False)
    pit_stops = Column(Integer, default=0)
    
    # Relace
    driver = relationship("Driver", back_populates="race_results")
    
    def __repr__(self):
        return f"<RaceResult(driver_id={self.driver_id}, position={self.finishing_position})>"


def select_all_drivers():
    drivers = session.query(Driver).filter(Driver.is_active == True).all()
    for driver in drivers:
        print(f"{driver.full_name} - #{driver.driver_number}")
    return drivers

def recursive_relation():
    principals = session.query(TeamPrincipal).all()
    
    for principal in principals:
        mentor_name = principal.mentor.full_name if principal.mentor else "Žádný"
        mentees = [m.full_name for m in principal.mentees]
        print("=" * 50)
        print(f"{principal.full_name}")
        print(f"  Mentor: {mentor_name}")
        print(f"  Mentees: {mentees if mentees else 'Žádní'}")
        print("=" * 50)

def update_driver_points(driver_id, additional_points):
    driver = session.query(Driver).filter(Driver.driver_id == driver_id).first()
    if driver:
        driver.career_points += additional_points
        session.commit()
        print(f"Updated {driver.full_name}'s points to {driver.career_points}")
    else:
        print("Driver not found.")

def drop_database():
    Base.metadata.drop_all(engine)
    print("All tables dropped.")   

def drop_drivers_table():
    Driver.__table__.drop(engine)
    print("Drivers table dropped.") 

if __name__ == "__main__":
    print("=" * 50)
    print("ORM SQLAlchemy - F1 Database Examples")
    print("=" * 50)
    
    # select_all_drivers()

    # update_driver_points(driver_id=1, additional_points=10)

    # recursive_relation()

    drop_drivers_table()

    session.close()
