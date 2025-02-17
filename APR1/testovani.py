# def secti(a,b):
#     return a+b 

# assert secti(1,2) == 4 

##### TEST DRIVEN DEVELOPMENT

def sect(a,b):
    return a+b

def test_secti_dve_cela_kladna_cisla():
    # AAA framework (Arrange, Act, Assert)  
    # Arrange
    vstup1 = 2
    vstup2 = 3
    ocekavany_vystup = 5
    # Act
    navraceny_vystup = sect(vstup1, vstup2)
    # Assert
    assert navraceny_vystup == ocekavany_vystup 

def test_secti_kladne_a_zaporne_cislo():
    vstup1 = 2
    vstup2 = -3
    ocekavany_vystup = -1
    navraceny_vystup = sect(vstup1, vstup2)
    assert navraceny_vystup == ocekavany_vystup 

def test_secti_dve_cele_zaporne_cisla():
    vstup1 = -2
    vstup2 = -3
    ocekavany_vystup = -5
    navraceny_vystup = sect(vstup1, vstup2)
    assert navraceny_vystup == ocekavany_vystup 

def teststrunner():
    test_secti_dve_cela_kladna_cisla()
    test_secti_kladne_a_zaporne_cislo()
    test_secti_dve_cele_zaporne_cisla()

def main():
    print("smiruju vlastni sestru :3")
    ...

teststrunner()
main()