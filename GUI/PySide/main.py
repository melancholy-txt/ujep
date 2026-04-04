import sys
from PySide6 import QtWidgets, QtCore, QtGui
from button import Buttons

DEFAULT_WIDTH = 300
DEFAULT_HEIGHT = 300

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Life Counter")
        # self.setCentralWidget(Buttons(players=2))
        # self.setMinimumSize(300, 200)
        self.create_menu()

    def create_menu(self):
        menu_widget = QtWidgets.QWidget()
        menu_layout = QtWidgets.QVBoxLayout()

        label = QtWidgets.QLabel("Select number of players:")
        label.setAlignment(QtCore.Qt.AlignCenter)
        menu_layout.addWidget(label)

        players_grid = QtWidgets.QGridLayout()
        players_grid.setSpacing(10)

        for index, players in enumerate([2, 3, 4]):
            btn = QtWidgets.QPushButton(f"{players} players")
            btn.setMinimumHeight(44)
            row = 0
            col = index
            players_grid.addWidget(btn, row, col)
            btn.clicked.connect(lambda checked=False, p=players: self.start_game(p))

        menu_layout.addLayout(players_grid)
        menu_layout.addStretch()

        menu_widget.setLayout(menu_layout)
        self.resize(DEFAULT_WIDTH * 2, DEFAULT_HEIGHT / 5)
        self.setCentralWidget(menu_widget)
    
    def start_game(self, players):
        cols = players if players <= 2 else 2
        rows = (players + cols - 1) // cols
        self.resize(DEFAULT_WIDTH * cols, (DEFAULT_HEIGHT * rows) + 40)
        # center the window on the screen        
        qr = self.frameGeometry()
        cp = QtGui.QGuiApplication.primaryScreen().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())
        players_layout = QtWidgets.QGridLayout()
        players_layout.setSpacing(10)
        for index in range(players):
            row = index // cols
            col = index % cols
            players_layout.addWidget(Buttons(players=players), row, col)

        back_button = QtWidgets.QPushButton("Back to menu")
        back_button.clicked.connect(self.create_menu)
        back_button.setFont(QtGui.QFont("Arial", 14))
        back_button.setFixedSize(150, 40)

        back_row = QtWidgets.QHBoxLayout()
        back_row.addStretch()
        back_row.addWidget(back_button)
        back_row.addStretch()

        screen_layout = QtWidgets.QVBoxLayout()
        screen_layout.addLayout(players_layout)
        screen_layout.addLayout(back_row)

        container = QtWidgets.QWidget()
        container.setLayout(screen_layout)
        self.setCentralWidget(container)



if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())