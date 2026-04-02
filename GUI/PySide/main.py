import sys
from PySide6 import QtWidgets, QtCore, QtGui
from button import Buttons

DEFAULT_WIDTH = 300
DEFAULT_HEIGHT = 200

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Life Counter")
        # self.setCentralWidget(Buttons(players=2))
        self.setMinimumSize(300, 200)
        self.create_menu()

    def create_menu(self):
        menu_widget = QtWidgets.QWidget()
        menu_layout = QtWidgets.QVBoxLayout()

        label = QtWidgets.QLabel("Select number of players:")
        label.setAlignment(QtCore.Qt.AlignCenter)
        menu_layout.addWidget(label)

        group = QtWidgets.QButtonGroup(self)
        for i in [2, 3, 4]:
            btn = QtWidgets.QRadioButton(f"{i} players")
            group.addButton(btn)
            menu_layout.addWidget(btn)
            btn.clicked.connect(lambda checked, players=i: self.start_game(players))

        menu_widget.setLayout(menu_layout)
        self.setCentralWidget(menu_widget)
    
    def start_game(self, players):
        self.resize(DEFAULT_WIDTH * players, DEFAULT_HEIGHT)
        # center the window on the screen        
        qr = self.frameGeometry()
        cp = QtGui.QGuiApplication.primaryScreen().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())
        self.main_layout = QtWidgets.QHBoxLayout()
        for p in range(players):
            self.main_layout.addWidget(Buttons(players=players))
        container = QtWidgets.QWidget()
        container.setLayout(self.main_layout)
        self.setCentralWidget(container)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())