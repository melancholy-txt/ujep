import sys
from PySide6 import QtWidgets, QtCore, QtGui

class Buttons(QtWidgets.QWidget):
    def __init__(self, players = 2):
        super().__init__()
        self.setObjectName("root")

        # Separate background layer so control widgets keep native styling.
        self.bg_widget = QtWidgets.QWidget(self)
        self.bg_widget.lower()
        self.bg_widget.setAttribute(QtCore.Qt.WidgetAttribute.WA_TransparentForMouseEvents, True)
        self.bg_widget.setAutoFillBackground(True)

        # Opaque controls surface prevents background color bleed into native controls.
        self.controls_surface = QtWidgets.QWidget(self)
        self.controls_surface.setAutoFillBackground(True)
        self.controls_surface.setPalette(QtWidgets.QApplication.palette())

        self.hp = 20 if players == 2 else 40

        self.counter = QtWidgets.QLineEdit(str(self.hp), self.controls_surface)
        self.counter.setAlignment(QtCore.Qt.AlignCenter)
        self.counter.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        self.counter.setValidator(QtGui.QIntValidator(0, 999, self))
        self.counter.setFont(QtGui.QFont("Arial", 48))
        self.counter.textChanged.connect(self.text_actualization)

        self.btn_plus = QtWidgets.QPushButton("+", self.controls_surface)
        self.btn_plus.clicked.connect(self.up_press)
        self.btn_plus.setAutoRepeat(True)
        self.btn_plus.setFont(QtGui.QFont("Arial", 24))

        self.btn_minus = QtWidgets.QPushButton("-", self.controls_surface)
        self.btn_minus.clicked.connect(self.down_press)
        self.btn_minus.setAutoRepeat(True)
        self.btn_minus.setFont(QtGui.QFont("Arial", 24))


        self.btn_menu = QtWidgets.QPushButton("Color", self.controls_surface)
        self.btn_menu.setFont(QtGui.QFont("Arial", 19))

        menu = QtWidgets.QMenu(self.btn_menu)
        menu.addAction("Red", lambda *args: self.color_change("red"))
        menu.addAction("Green", lambda *args: self.color_change("green"))
        menu.addAction("Blue", lambda *args: self.color_change("blue"))
        menu.addAction("White", lambda *args: self.color_change("white"))
        menu.addAction("Black", lambda *args: self.color_change("black"))
        self.btn_menu.setMenu(menu)

        right_layout = QtWidgets.QVBoxLayout()
        right_layout.addWidget(self.btn_plus)
        right_layout.addWidget(self.btn_minus)
        right_layout.addWidget(self.btn_menu)

        main_layout = QtWidgets.QHBoxLayout()
        main_layout.addWidget(self.counter, 7)
        main_layout.addLayout(right_layout, 3)

        self.controls_surface.setLayout(main_layout)

        outer_layout = QtWidgets.QVBoxLayout(self)
        outer_layout.setContentsMargins(10, 10, 10, 10)
        outer_layout.addWidget(self.controls_surface)

        self.bg_widget.setGeometry(self.rect())
        self.color_change("black")

    def text_actualization(self, text):
        if text == "+" or text == "-":
            return 
        self.hp = int(text)

    def up_press(self):
        self.hp += 1
        self.counter.setText(str(self.hp))
        # self.text_actualization(self.counter.text())

    def down_press(self):
        self.hp -= 1
        self.counter.setText(str(self.hp))
        # self.text_actualization(self.counter.text())

    def color_change(self, color):
        palette = self.bg_widget.palette()
        palette.setColor(QtGui.QPalette.ColorRole.Window, QtGui.QColor(color))
        self.bg_widget.setPalette(palette)

    def resizeEvent(self, event):
        self.bg_widget.setGeometry(self.rect())
        super().resizeEvent(event)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = Buttons()
    window.show()
    sys.exit(app.exec())