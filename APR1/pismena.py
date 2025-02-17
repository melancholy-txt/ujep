citac_slo = dict()

veta = "ashfgsdbfudshfud"

pismena = veta.lower().replace(".", "").replace(" ", "")

for pismeno in veta:
    # print(pismeno)
    if pismeno not in citac_slo.keys():
        citac_slo[pismeno] = 1
    else:
        citac_slo[pismeno] += 1


