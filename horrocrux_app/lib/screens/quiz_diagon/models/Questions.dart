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
    "question": "¿Los magos y las brujas dónde sacan el dinero?",
    "options": ['Gringotts', 'Ollivander’s', 'Flourish & Blotts', 'Gambol y Japes'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "¿Qué son los “knuts”?",
    "options": ['El nombre del banco de los magos y las brujas', 'Un bar donde Hagrid lleva a Harry',
              'Una moneda mágica de bronce', 'Uno de los libros que Harry necesita para Hogwarts'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "¿Qué es el “Caldero Chorreante”?",
    "options": ['El banco de los magos y brujas', 'Un bar pequeño pero muy famoso',
                'El lugar en el que duermen los Dursley', 'La bebida favorita de magos y brujas'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "¿Qué profesor encuentran Hagrid y Harry en su visita al “Caldero Chorreante”?",
    "options": ['Profesor Snape', 'Profesor Dumbledore', 'Profesor Slughorn', 'Profesor Quirrel'],
    "answer_index": 3,
  },
  {
    "id": 5,
    "question": "Las varitas son...",
    "options": ['las que escogen al mago', 'indestructibles', 'para todos iguales', 'lo único necesario para ir a Hogwarts'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Para ir a Hogwarts, Harry tiene que coger el tren en la estación de...",
    "options": ['Ollivanders', 'Gringotts', 'Kings Cross', '9 y 3/4'],
    "answer_index": 2,
  },
];
