import 'package:flutter/material.dart';

class PrivacyPolitics extends StatelessWidget {
  const PrivacyPolitics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.1),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.height * 0.015, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "1. Identificación del responsable",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    '''De conformidad con lo establecido en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (en lo sucesivo la “Ley”) y su Reglamento le informamos que Amor y Convicción, sus filiales y/o subsidiarias (en lo sucesivo el “Responsable”), con domicilio en Francisco Javier Mina 248, Pedregal de la Villa, 83290 Hermosillo, Son., tratará los datos personales que Usted como Titular nos proporcione en términos del presente Aviso de Privacidad. 

El tratamiento de datos personales de titulares residentes o cuya nacionalidad sean de algún país perteneciente a la Unión Europea, será de conformidad con las disposiciones del Reglamento General de Protección de Datos de la Unión Europea (“RGPD”).''',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.height * 0.035, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "2. Datos personales que recabamos",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    "Los datos personales que recabaremos serán aquellos que usted haya incluido en su perfil de cada red social con la que ingrese y esté habilitada en la aplicación, y serán tratados y resguardados con base en los principios establecidos en la Ley y su Reglamento, los cuales son: licitud, consentimiento, información, calidad, finalidad, lealtad, proporcionalidad y responsabilidad. Para cumplir con las finalidades que se mencionan en el presente Aviso, requerimos que nos proporcione los siguientes Datos Personales: Nombre completo, Correo electrónico, Teléfono (fijo y móvil), Domicilio o Lugar de residencia actual y previos, Fecha de nacimiento o cumpleaños, Ocupación, cuenta de Google+, Imágenes fotográficas de usted  y Respuestas que proporcione en actividades de la aplicación.",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.height * 0.035, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "3. Finalidades del tratamiento de sus datos personales",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    '''El Responsable, sus filiales y/o subsidiarias, recaban sus datos personales y datos personales sensibles con el objeto de utilizarlos para los siguientes fines:

a) Obtener información y datos estadísticos de hábitos de navegación.

b) Identificar perfiles que ingresan a la aplicación.

c) Filtrar contenidos basado en la cuenta de correo de acceso.

d) Para fines de mercadotecnia, publicidad y proyección comercial.

e) Para la mejora del contenido que se le ofrece en la aplicación.''',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.height * 0.035, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "4. Transferencia de sus datos personales",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    "Le informamos que sus datos personales y datos personales sensibles, podrían ser transferidos dentro y fuera del país, a los siguientes destinatarios, para las finalidades señaladas en el apartado III anterior: Empresas filiales, subsidiarias y/o del mismo grupo del responsable, así como a nuestros clientes, proveedores, sociedades y asociaciones dentro y fuera del ramo.",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.height * 0.035, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "5. Medios para limitar el uso o divulgación de sus datos personales",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    "Hacemos de su conocimiento que sus datos personales y datos personales sensibles serán resguardados bajo estrictas medidas de seguridad administrativas, técnicas y físicas las cuales han sido implementadas, en términos del Reglamento, con el objeto de proteger y garantizar sus datos personales contra daño, pérdida, alteración, destrucción o el uso, acceso o tratamiento no autorizados. A fin de garantizar la seguridad y confidencialidad adecuadas de los datos personales, aplicamos las siguientes medidas de seguridad: (a) Cifrado de datos en tránsito; (b) Controles de autenticación segura de usuarios; (c) Repositorio de Datos; (d) Soluciones de monitorización de red.",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.height * 0.035, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "6. Medios para revocar el consentimiento para el tratamiento de sus datos personales",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    '''Usted podrá revocar su consentimiento para el tratamiento de sus datos personales de la misma forma por la cual otorgó su consentimiento. Asimismo Usted tiene derecho de: (i) Acceder a sus datos personales en nuestro poder y conocer los detalles del tratamiento de los mismos, (ii) Rectificarlos en caso de ser inexactos o incompletos, (iii) Cancelarlos cuando considere que no se requieren para alguna de las finalidades señaladas en el presente Aviso, estén siendo utilizados para finalidades no consentidas o haya finalizado la relación contractual o de servicio, u (iv) Oponerse al tratamiento de los mismos para fines específicos, según lo disponga la Ley (en adelante “Derechos ARCO”). Para el ejercicio de sus Derechos ARCO, deberá presentar una Solicitud (en adelante “Solicitud ARCO”), a la atención del Oficial de Privacidad, a la Dirección de Contacto o al siguiente correo electrónico: amor.conviccion@gmail.com acompañada de la siguiente información y documentos:

a) Su nombre, domicilio y correo electrónico para poder comunicarle la respuesta a la Solicitud ARCO;

b) Una copia de los documentos que acrediten su identidad (copia de IFE, pasaporte o cualquier otra identificación oficial) o en su caso, los documentos que acrediten su representación legal, cuyo original deberá presentar para poder recibir la respuesta del Responsable;

c) Una descripción clara y precisa de los datos personales respecto de los cuales busca ejercer alguno de los Derechos ARCO;

d) Cualquier documento o información que facilite la localización de sus datos personales;

e) En caso de solicitar una rectificación de sus datos personales, deberá de indicar también, las modificaciones a realizarse y aportar la documentación que sustente su petición.

El Oficial de Privacidad responderá y dará seguimiento a su Solicitud de Derechos ARCO en los plazos establecidos por la Ley.
De igual manera, Usted podrá revocar su consentimiento para el tratamiento de sus datos personales siguiendo el mismo procedimiento que el mencionado para el ejercicio de sus Derechos ARCO.
Los titulares residentes o cuya nacionalidad sean de algún país perteneciente a la Unión Europea, podrán ejercer, de conformidad con los artículos 15 a 22 del RGPD, los siguientes derechos específicos: (a) Derecho de acceso; (b) Derecho de rectificación; (c) Derecho de supresión; (d) Derecho a la limitación de procesamiento; (e) Derecho a la portabilidad de datos; (f) Derecho a formular objeciones; (g) Derecho a no ser objeto de decisiones individualizadas automatizadas; (h) Derecho a presentar una queja ante una autoridad de control; (i) Cuando el procesamiento de datos se base en el consentimiento, el interesado puede retirar su consentimiento en cualquier momento.
Cualquier duda sobre los derechos antes mencionados, favor de ponerse en contacto a través del siguiente correo electrónico: amor.conviccion@gmail.com
''',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, size.height * 0.035, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "7. Tiempo que almacenamos sus datos",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    '''Almacenamos en nuestros sistemas los datos personales que recopilamos de una forma que permite la identificación del Titular durante el tiempo necesario para los fines para los que se recopilaron los datos o para los cuales se procesan posteriormente.

Determinamos este período específico de tiempo teniendo en cuenta:

• La necesidad de mantener almacenados los datos personales recopilados para poder ofrecer servicios establecidos con el usuario;

• Para salvaguardar un interés legítimo del Responsable de tratamiento de datos como se describe en los propósitos;

• La existencia de obligaciones legales específicas que hacen que el procesamiento y el almacenamiento relacionado sean necesarios durante un período específico de tiempo;

''',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.015),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "8. Cambios o modificaciones al presente Aviso",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Text(
                    '''El Responsable se reserva el derecho de efectuar en cualquier momento modificaciones o actualizaciones al presente Aviso, en el entendido de que toda modificación al mismo se hará de su conocimiento por correo electrónico o a través de nuestra página aplicación móvil: Amor y Convicción PF
Le informamos que, por su seguridad, la de los menores y terceros de los que podamos recabar información o que Usted nos proporcione, solicitamos su consentimiento expreso para el uso y tratamiento de la misma en los mismos términos establecidos en el presente Aviso de Privacidad y de ninguna manera se le dará una protección distinta que la de los datos proporcionados aquí mismo. También es importante que tenga presente que dichos datos no serán transferidos a ningún tercero distinto de los establecidos en el presente documento.
Lo redactado en el presente Aviso no se entenderá bajo ninguna circunstancia como un ofrecimiento o propuesta de índole laboral o prestación de servicios.''',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
