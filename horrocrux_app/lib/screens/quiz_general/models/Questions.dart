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
    "question": "¿Cuál de estos tipos de escobas no pertenece al juego?",
    "options": ['Flecha de plata', 'Cometa', 'Asteroide', 'Estrella fugaz'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "¿Quién le regaló a Harry Potter una escoba Saeta de Fuego?",
    "options": ['Sirius Black', 'Minerva McGonagall', 'Albus Dumbledore', 'Rubeus Hagrid'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "Antiguamente, en lugar de con una snitch,\nse jugaba con un animal. ¿Cómo se llamaba esa criatura?",
    "options": ['Snidget dorado', 'Snidget espacial', 'Snidget precioso', 'Snidget amarillo'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "¿Cuál es la duración del juego?",
    "options": ['50 minutos', 'Indefinida', '90 minutos', '100 minutos'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "¿Qué falta cometió Draco Malfoy en Harry Potter y el prisionero de Azkaban?",
    "options": ['Usar la varita para hechizar\na un jugador', 'Bajarse de su escoba',
                'Volar demasiado alto', 'Coger la escoba de un oponente'],
    "answer_index": 3,
  },
  {
    "id": 6,
    "question": "Cada cuantos años se celebraba el campeonato de los tres magos?",
    "options": ['Cada ocho años', 'Cada cuatro años', 'Cada seis años', 'Cada cinco años'],
    "answer_index": 1,
  },
];
