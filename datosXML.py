
listaFechas = ['01-03-2022', '02-03-2022', '03-03-2022', '04-03-2022', '05-03-2022', '06-03-2022', '07-03-2022', '08-03-2022', '09-03-2022', '10-03-2022', '11-03-2022', '12-03-2022', '13-03-2022', '14-03-2022', '15-03-2022', '16-03-2022', '17-03-2022', '18-03-2022', '19-03-2022', '20-03-2022', '21-03-2022', '22-03-2022', '23-03-2022', '24-03-2022', '25-03-2022', '26-03-2022', '27-03-2022', '28-03-2022', '29-03-2022', '30-03-2022', '31-03-2022', '01-04-2022', '02-04-2022', '03-04-2022', '04-04-2022', '05-04-2022', '06-04-2022', '07-04-2022', '08-04-2022', '09-04-2022', '10-04-2022', '11-04-2022', '12-04-2022', '13-04-2022', '14-04-2022', '15-04-2022', '16-04-2022', '17-04-2022', '18-04-2022', '19-04-2022', '20-04-2022', '21-04-2022', '22-04-2022', '23-04-2022', '24-04-2022', '25-04-2022', '26-04-2022', '27-04-2022', '28-04-2022', '29-04-2022', '30-04-2022', '01-05-2022', '02-05-2022', '03-05-2022', '04-05-2022', '05-05-2022', '06-05-2022', '07-05-2022', '08-05-2022', '09-05-2022', '10-05-2022', '11-05-2022', '12-05-2022', '13-05-2022', '14-05-2022', '15-05-2022', '16-05-2022', '17-05-2022', '18-05-2022', '19-05-2022', '20-05-2022', '21-05-2022', '22-05-2022', '23-05-2022', '24-05-2022', '25-05-2022', '26-05-2022', '27-05-2022', '28-05-2022', '29-05-2022', '30-05-2022', '31-05-2022', '01-06-2022', '02-06-2022', '03-06-2022', '04-06-2022', '05-06-2022', '06-06-2022', '07-06-2022', '08-06-2022', '09-06-2022', '10-06-2022', '11-06-2022', '12-06-2022', '13-06-2022', '14-06-2022', '15-06-2022', '16-06-2022', '17-06-2022', '18-06-2022', '19-06-2022', '20-06-2022', '21-06-2022', '22-06-2022', '23-06-2022', '24-06-2022', '25-06-2022', '26-06-2022', '27-06-2022', '28-06-2022', '29-06-2022', '30-06-2022']

def runScripts():
    import secrets
    def email_generator():
        return f"{secrets.token_hex(8)}@gmail.com"

    from textwrap import indent
    import xml.etree.ElementTree as ET
    import random
    import names

    valoresIndentidadUsados = []
    valoresNombresUsados = []
    valoresFincaUsados = []
    valoresMetrosUsados = []
    valorMedidorUsados = []
    valorNumerosUsados = []
    valorCorreosUsados = []


    documentosIndentidad = ["Cedula CR","Persona Jurídica CR","Pasaporte CR"]
    usoPropiedad = ["Habitacion","Comercial","Industrial","Lote baldio","Agricola"]
    zonaPropiedad = ["Residencial","Agricola","Bosque","Zona industrial","Zona comercial"]
    tipoDocumento = ["Cedula","Persona juridica", "Pasaporte"]
    tipoUsuarioC = ["Administrador", "Propietario"]
    tipoAsociacionC = ["Eliminar","Agregar"]


    xml_doc = ET.Element('Datos')

    for x in range(0,len(listaFechas)):

        valoresIndentidadUsadosAux = []
        valoresNombresUsadosAux = []
        valoresFincaUsadosAux = []
        valoresMetrosUsadosAux = []
        valorMedidorUsadosAux = []

        Operacion = ET.SubElement(xml_doc,'Operacion', Fecha = listaFechas[x])

        Personas = ET.SubElement(Operacion,'Personas')

        Propiedades = ET.SubElement(Operacion, 'Propiedades')

        PersonasyPropiedades = ET.SubElement(Operacion, 'PersonasyPropiedades')

        Usuarios = ET.SubElement(Operacion, 'Usuario')

        PropiedadesyUsuarios = ET.SubElement(Operacion, 'PropiedadesyUsuarios')



        #############################################################################

        cantidadPersonas = random.randint(5, 11)

        for x in range(cantidadPersonas):

            tipoIdentidad = documentosIndentidad[random.randint(0,2)]

            while(True):

                numero1 = random.randint(10000000,99999999)
                numero2 = random.randint(10000000,99999999)

                if(numero1 not in valorNumerosUsados and numero2 not in valorNumerosUsados):
                    valorNumerosUsados.append(numero1)
                    valorNumerosUsados.append(numero2)
                    break

            while(True):

                email = email_generator()

                if(email not in valorCorreosUsados):
                    valorCorreosUsados.append(email)
                    break

            while(True):

                nombrePersona = names.get_full_name()

                if(nombrePersona not in valoresNombresUsados):
                    valoresNombresUsados.append(nombrePersona)
                    break

            while(True):
                numeroIdentidad = random.randint(10000000,99999999)
                if(numeroIdentidad not in valoresIndentidadUsados):
                    valoresIndentidadUsados.append(numeroIdentidad)
                    valoresIndentidadUsadosAux.append(numeroIdentidad)
                    break

            
            nombrePersona = names.get_full_name()
            ET.SubElement(Personas, 'Persona', Nombre = str(nombrePersona).replace("'", '"'), TipoDocumentoIdentidad = str(tipoIdentidad),ValorDocumentoIdentidad=str(numeroIdentidad), Telefono1 = str(numero1), Telefono2 = str(numero2), Email = email)


    #############################################################################

        cantidadPropiedades = random.randint(cantidadPersonas,16)
        
        for x in range(0, cantidadPropiedades):

            numeroFinca = random.randint(1000,4000)
            metrosFinca = random.randint(450,2000)
            tipoUsoPropiedadA = usoPropiedad[random.randint(0,4)]
            tipoZonaPropiedadA = zonaPropiedad[random.randint(0,4)]
            numeroMedidor = random.randint(1000,4000)
            valorFiscal = random.randint(1000000000,9999999999)


            while(True):
                if(numeroFinca not in valoresFincaUsados):
                    valoresFincaUsados.append(numeroFinca)
                    valoresFincaUsadosAux.append(numeroFinca)
                    break
                else:
                    valoresFincaUsados.append(numeroFinca)
                    numeroFinca = random.randint(250,2000)
                    valoresFincaUsadosAux.append(numeroFinca)
            
            while(True):
                if(numeroMedidor not in valorMedidorUsados):
                    valorMedidorUsados.append(numeroMedidor)
                    break
                else:
                    valorMedidorUsados.append(numeroMedidor)
                    numeroMedidor = random.randint(250,2000)
                    
            ET.SubElement(Propiedades, 'Propiedad', NumeroFinca = str(numeroFinca), MetrosCuadrados = str(metrosFinca), tipoUsoPropiedad = str(tipoUsoPropiedadA), tipoZonaPropiedad = str(tipoZonaPropiedadA), NumeroMedidor = str(numeroMedidor), ValorFiscal = str(valorFiscal))

    #############################################################################
        contadorFinca = 0
        contadorPersonas = 0
        
        while(contadorPersonas < len(valoresIndentidadUsadosAux)):

            tipoAsociacion = tipoAsociacionC[random.randint(0,1)]
            cantidadPropiedades = random.randint(2,3)

            if(cantidadPersonas == len(valoresIndentidadUsadosAux)-3):
                ET.SubElement(PersonasyPropiedades, 'PropiedadPersona', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]), TipoAsociacion = str(tipoAsociacion))
                ET.SubElement(PropiedadesyUsuarios, 'UsuarioPropiedad', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]), TipoAsociacion = str(tipoAsociacion))
                contadorPersonas+=1
                contadorFinca+=1
            else:
                if(cantidadPropiedades==1):
                    ET.SubElement(PersonasyPropiedades, 'PropiedadPersona', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PropiedadesyUsuarios, 'UsuarioPropiedad', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]), TipoAsociacion = str(tipoAsociacion))
                if(cantidadPropiedades==2):
                    ET.SubElement(PersonasyPropiedades, 'PropiedadPersona', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PersonasyPropiedades, 'PropiedadPersona', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca+1]), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PropiedadesyUsuarios, 'UsuarioPropiedad', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PropiedadesyUsuarios, 'UsuarioPropiedad', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]+1), TipoAsociacion = str(tipoAsociacion))
                if(cantidadPropiedades==3):
                    ET.SubElement(PersonasyPropiedades, 'PropiedadPersona', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PersonasyPropiedades, 'PropiedadPersona', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]+1), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PersonasyPropiedades, 'PropiedadPersona', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]+2), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PropiedadesyUsuarios, 'UsuarioPropiedad', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]+1), TipoAsociacion = str(tipoAsociacion))
                    ET.SubElement(PropiedadesyUsuarios, 'UsuarioPropiedad', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[contadorPersonas]), NumeroFinca = str(valoresFincaUsados[contadorFinca]+2), TipoAsociacion = str(tipoAsociacion))
                contadorPersonas+=1
                contadorFinca+=1


    #############################################################################

        for x in range(cantidadPersonas):

            tipoAsociacion = tipoAsociacionC[random.randint(0,1)]
            tipoUsuario = tipoUsuarioC[random.randint(0,1)]
            ET.SubElement(Usuarios, 'Usuario', ValorDocumentoIdentidad = str(valoresIndentidadUsadosAux[x]), TipoUsuario = str(tipoUsuario), TipoAsociacion = str(tipoAsociacion))



                    
    tree = ET.ElementTree(xml_doc)
    ET.indent(tree)
    tree.write('Operaciones.xml', encoding='UTF8', xml_declaration=True)




runScripts()
