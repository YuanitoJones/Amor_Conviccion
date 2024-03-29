class CuestionarioBloque {
  Map<int, List> drogodependencia = {
    0: [
      '1.- ¿De dónde viene la palabra adicto?',
      'De griego "Pistis"',
      'Del latín "Addictus"',
      'De latín "Vitium"'
    ],
    1: [
      '2.- Menciona los 4 tipos de consumo.',
      'Experimental, ocasional, habitual, crónico compulsivo.',
      'A diario, frecuente, de vez en cuando, ocasional.',
      'Con los amigos, en fiestas, en mi casa, en reuniones sociales.'
    ],
    2: [
      '3.- ¿Cuáles son los 3 tipos de adicciones?',
      'Compras compulsivas, consumo de alcohol, relaciones neuróticas.',
      'Actividades, relaciones y sustancias.',
      'Adicción a objetos, personas y drogas.'
    ],
    3: [
      '4.- ¿Cómo saber si un hábito se puede convertir en una adicción?',
      'Si se hace a escondidas y si genera problemas.',
      'Si se hace a diario.',
      'Si se me resulta agradable y desagradable.'
    ],
    4: [
      '5.- ¿Cuántas sustancias tóxicas contienen un cigarro de tabaco?',
      'Más de 100.',
      'Más de 50.',
      'Más de 4,000.'
    ],
    5: [
      '6.- ¿Cuál es la “mamá” de las drogas?',
      'La cocaína.',
      'El alcohol.',
      'La heroína'
    ],
    6: [
      '7.- ¿Qué características debe tener una sustancia para considerarla \"droga\"?',
      'Que genere ansiedad, dependencia y tolerancia.',
      'Que genere sensación de placer.',
      'Que genere sentimientos de culpa.'
    ],
    7: [
      '8.- ¿Es lo mismo estar \"drogado\" a estar "borracho"?',
      'No',
      'Depende del grado de embriaguez',
      'Si'
    ],
    8: [
      '9.- ¿Cuáles son los 4 tipos de bebedores?',
      'Bebedor compulsivo, bebedor tranquilo, bebedor agresivo, bebedor triste.',
      'Bebedor social, bebedor fuerte, bebedor problema, alcohólico.',
      'Bebedor agresivo, bebedor alegre, bebedor conversador, bebedor tranquilo.'
    ]
  };

  Map<int, List> liderazgo = {
    0: [
      '¿Qué es liderazgo?',
      'Influencia, carácter, ejemplo',
      'Voluntad, esfuerzo, empatía',
      'Visión, tenacidad. solidaridad'
    ],
    1: [
      '¿Cuáles son las tres responsabilidades de un líder?',
      'Cuidar de las personas',
      'Crear identidad, visión y cultura',
      'Ayudar a los que necesitan'
    ],
    2: [
      '¿Cuál es el mensaje central de la historia del basquetbolista Irving Magic Jhonson?',
      'La influencia',
      'La voluntad',
      'El carácter'
    ],
    3: [
      '¿Cuál es el mensaje central de la historia de Butch O\'Hare?',
      'La voluntad',
      'El esfuerzo',
      'El carácter'
    ],
    4: [
      '¿Cuál es la conducta que tienes que cambiar hoy para mejorar como padre de familia?'
    ],
    5: [
      'En una escala del 1 al 10, ¿Cómo calificas al liderazgo como cualidad en tu vida?'
    ]
  };

  List<String> liderazgo2 = [
    'Como padre o madre de familia escribe la misión y visión de tu hogar.',
    'Cita a tu hijo/a y hazle las siguientes preguntas y escribe su respuesta. Cuando tengas mi edad, ¿Te gustaría ser como yo?',
    '¿Por qué lo consideras así?'
  ];

  List<String> intimidad = [
    'Mantener comunicación diaria con ellos',
    'Interesarme por lo que hacen',
    'Acompañarlos en sus actividades cuando sea posible',
    'Tratar de estar siempre informado sobre lo que piensan y hacen',
    'Otro. Explique'
  ];

  List<String> intimidad2 = [
    '¿Qué enseñanza te deja el vídeo del pequeño chango?',
    '¿Qué estrategias utilizarían para supervisar mejor a sus hijos?'
  ];

  Map<String, dynamic> anomia = {
    'Melancólico': {
      'Fortalezas': [
        'Dotado',
        'Analítico',
        'Estratega',
        'Abnegado',
        'Trabajador',
        'Auto-disciplinado'
      ],
      'Debilidades': [
        'Auto-centrado',
        'Propenso a persecución',
        'Vengativo',
        'Susceptible',
        'Teórico',
        'Insociable',
        'Crítico',
        'Negativo'
      ]
    },
    'Sanguíneo': {
      'Fortalezas': [
        'Expresivo',
        'Atento',
        'Cálido y amistoso',
        'Hablador',
        'Entusiasta',
        'Compasivo'
      ],
      'Debilidades': [
        'Indisciplinado inestable',
        'Improductivo',
        'Egocéntrico',
        'Exagerado'
      ]
    },
    'Colérico': {
      'Fortalezas': [
        'Voluntarioso',
        'Independiente',
        'Visionario',
        'Práctico',
        'Productivo',
        'Decidido',
        'Líder'
      ],
      'Debilidades': [
        'Frío / no emocional',
        'Auto suficiente',
        'Impetuoso',
        'Egocéntrico',
        'Dominante',
        'Rencoroso',
        'Sarcástico',
        'Cruel'
      ]
    },
    'Flemático': {
      'Fortalezas': [
        'Tranquilo',
        'Confiable',
        'Objetivo',
        'Diplomático',
        'Eficaz / Organizado',
        'Práctico / Humorista',
        'Calmado plácido'
      ],
      'Debilidades': [
        'Sin motivación',
        'Moroso',
        'Egoísta',
        'Mezquino',
        'Auto - protector',
        'Indeciso',
        'Cobarde',
        'Ansioso'
      ]
    }
  };

  Map<String, dynamic> amorYPerdon = {
    "Palabras de afirmación": [
      "Palabras de animo.",
      "Palabras amables.",
      "Cumplidos.",
      "Elogios.",
      "Palabras humildes."
    ],
    "Tiempo de calidad": [
      "Hacer cosas juntos",
      "Dar un paseo",
      "Salir solos",
      "Hablar mirandose a los ojos",
      "Conversar sobre el dia"
    ],
    "Regalos": [
      "Dar regalos aunque no sea fecha especial",
      "Estar ahi cuando la pareja lo necesita",
      "Dar pequeños detalles"
    ],
    "Actos de servicio": [
      "Ayudar con las tareas del hogar",
      "Tareas que realizas como acto de amor"
    ],
    "Contacto físico": ["Abrazos", "Caricias", "Tomarse de la mano"]
  };

  List<String> amorYPerdon2 = [
    '¿Qué diferencia existe entre pedir perdón y pedir disculpas?',
    'En tu familia, ¿cómo practican el perdón?',
    '¿Qué estrategias usarían en tu familia para reforzar el perdón '
        'cuando alguien falle?',
    '¿Qué relación tiene la comunicación con el perdón?',
    'En una escala del 1 al 10, ¿qué también calificas esta '
        'cualidad en tu vida?',
    '¿Qué enseñanza familiar les dejó está sesión?'
  ];
}
