// ignore_for_file: constant_identifier_names

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "¿A parte de en Hogwarts, en que otra escuela mágica se sabe que imparten esta asignatura?",
    "options": ['Castelobruxo', 'Instituto Durmstrang', 'Colegio Ilvermorny de Magia y Hechicería', 'Mahoutokoro'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "¿Quien fue profesor de esta materia después de Herbert Beery?",
    "options": ['Sybill Trelawney', 'Neville Longbottom', 'Pomona Sprout', 'Beedle el Bardo'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "¿Quien de estos no consiguió el TIMO en herbología?",
    "options": ['Barty Crouch Jr', 'Seamus Finnigan', '	Bill Weasley', 'Dean Thomas'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "¿Como pueden ser destruidos los pinchos de los arbustos puntiagudos?",
    "options": ['Incendio', 'Reducto', 'Lumos', 'Impedimenta'],
    "answer_index": 3,
  },
  {
    "id": 5,
    "question": "¿Cuando se da la clase en primer curso?",
    "options": ['Lunes', 'Miercoles', 'Jueves', 'Viernes'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Libro Obligatorio",
    "options": ['Plantas carnivoras del mundo', 'Arboles carnivoros del mundo', 
                'Plantas y arboles carnivoros del mundo', 'Herbología general'],
    "answer_index": 1,
  },
];
