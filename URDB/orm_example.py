# ORM Example - SQLAlchemy s F1 databází
# Instalace: pip install sqlalchemy pymysql

from sqlalchemy import create_engine, Column, Integer, String, Boolean, Date, ForeignKey, DECIMAL, Text, Enum
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

# ============================================
# KONFIGURACE PŘIPOJENÍ
# ============================================

# Připojení k MySQL databázi
# Formát: mysql+pymysql://user:password@host:port/database
DATABASE_URL = "mysql+pymysql://root:password@localhost:3306/f1_database"

engine = create_engine(DATABASE_URL, echo=True)  # echo=True pro logování SQL
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()

# ============================================
# DEFINICE MODELŮ (ORM MAPOVÁNÍ)
# ============================================

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


# ============================================
# PŘÍKLADY POUŽITÍ ORM
# ============================================

def example_select_all_drivers():
    """SELECT * FROM drivers WHERE is_active = true"""
    drivers = session.query(Driver).filter(Driver.is_active == True).all()
    for driver in drivers:
        print(f"{driver.full_name} - #{driver.driver_number}")
    return drivers


def example_select_with_join():
    """SELECT s JOIN - piloti s jejich zeměmi"""
    results = session.query(Driver, Country)\
        .join(Country, Driver.country_id == Country.country_id)\
        .filter(Driver.is_active == True)\
        .all()
    
    for driver, country in results:
        print(f"{driver.full_name} from {country.country_name}")
    return results


def example_select_with_relationship():
    """Použití relationship - automatický JOIN"""
    drivers = session.query(Driver).filter(Driver.is_active == True).all()
    for driver in drivers:
        # SQLAlchemy automaticky načte country díky relationship
        print(f"{driver.full_name} from {driver.country.country_name}")
    return drivers


def example_aggregate():
    """Agregační funkce - průměrné body pilotů"""
    from sqlalchemy import func
    
    avg_points = session.query(func.avg(Driver.career_points)).scalar()
    print(f"Průměrné kariérní body: {avg_points}")
    
    # Piloti s nadprůměrnými body
    above_avg = session.query(Driver)\
        .filter(Driver.career_points > avg_points)\
        .order_by(Driver.career_points.desc())\
        .all()
    
    for driver in above_avg:
        print(f"{driver.full_name}: {driver.career_points} bodů")
    return above_avg


def example_insert():
    """INSERT - vytvoření nového pilota"""
    new_driver = Driver(
        first_name="Test",
        last_name="Driver",
        country_id=1,  # Předpokládáme existující country_id
        date_of_birth="2000-01-01",
        driver_number=99,
        is_active=True
    )
    
    session.add(new_driver)
    session.commit()
    print(f"Vytvořen pilot s ID: {new_driver.driver_id}")
    return new_driver


def example_update():
    """UPDATE - aktualizace pilota"""
    driver = session.query(Driver).filter(Driver.driver_number == 99).first()
    if driver:
        driver.career_wins = driver.career_wins + 1
        session.commit()
        print(f"Aktualizován pilot: {driver.full_name}, wins: {driver.career_wins}")
    return driver


def example_delete():
    """DELETE - smazání pilota"""
    driver = session.query(Driver).filter(Driver.driver_number == 99).first()
    if driver:
        session.delete(driver)
        session.commit()
        print(f"Smazán pilot: {driver.full_name}")


def example_transaction():
    """Ukázka transakce s rollback"""
    try:
        # Začátek transakce (automaticky při první operaci)
        driver1 = session.query(Driver).filter(Driver.driver_id == 1).first()
        driver1.career_wins += 10
        
        driver2 = session.query(Driver).filter(Driver.driver_id == 2).first()
        driver2.career_wins += 10
        
        # Simulace chyby
        # raise Exception("Testovací chyba")
        
        session.commit()
        print("Transakce úspěšně dokončena (COMMIT)")
        
    except Exception as e:
        session.rollback()
        print(f"Chyba - transakce vrácena zpět (ROLLBACK): {e}")


def example_recursive_relation():
    """Ukázka rekurzivní relace - mentor/mentee"""
    principals = session.query(TeamPrincipal).all()
    
    for principal in principals:
        mentor_name = principal.mentor.full_name if principal.mentor else "Žádný"
        mentees = [m.full_name for m in principal.mentees]
        print(f"{principal.full_name}")
        print(f"  Mentor: {mentor_name}")
        print(f"  Mentees: {mentees if mentees else 'Žádní'}")


# ============================================
# SPUŠTĚNÍ PŘÍKLADŮ
# ============================================

if __name__ == "__main__":
    print("=" * 50)
    print("ORM SQLAlchemy - F1 Database Examples")
    print("=" * 50)
    
    # Odkomentujte příklady, které chcete spustit:
    
    # print("\n--- SELECT všech aktivních pilotů ---")
    # example_select_all_drivers()
    
    # print("\n--- SELECT s JOIN ---")
    # example_select_with_join()
    
    # print("\n--- SELECT pomocí relationship ---")
    # example_select_with_relationship()
    
    # print("\n--- Agregační funkce ---")
    # example_aggregate()
    
    # print("\n--- INSERT nového pilota ---")
    # example_insert()
    
    # print("\n--- UPDATE pilota ---")
    # example_update()
    
    # print("\n--- DELETE pilota ---")
    # example_delete()
    
    # print("\n--- Transakce ---")
    # example_transaction()
    
    # print("\n--- Rekurzivní relace ---")
    # example_recursive_relation()
    
    print("\nOdkomentujte příklady v __main__ pro spuštění.")
    
    # Zavření session
    session.close()
