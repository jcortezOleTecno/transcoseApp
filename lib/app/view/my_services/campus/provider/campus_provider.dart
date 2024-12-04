import 'package:flutter/material.dart';
import 'package:vemare/app/data/campus_repository.dart';
import 'package:vemare/app/domain/model/campus_model.dart';

class CampusProvider with ChangeNotifier{

  CampusProvider(this._campusRepository){
    initialData();
  }

  final CampusRepository _campusRepository;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  List<CampusModel> campus = [];

  Future initialData() async{
    await getCampus();
    loadData = false;
  }

  Future getCampus() async {
    //campus = campusAux.map((e) => e).toList();
    campus = await _campusRepository.getCampus();
  }

}

/*List<CampusModel> campusAux = [
  CampusModel(
      id: 1,
      title: 'Título del curso 1',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
      image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
      status: '1',
      topics: [
      TopicsModel(
        id: 1,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Introducción',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: true,
        duration: const TimeOfDay(hour: 0,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 2,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 3,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 2',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 4,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 3',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 5,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 4',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
    ],
  ),
  CampusModel(
      id: 2,
      title: 'Título del curso 2',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
      image: 'https://media.istockphoto.com/id/2148239914/es/foto/group-of-diverse-friends-outdoors-on-picnic-talking-and-drinking-coffee-to-go.jpg?s=2048x2048&w=is&k=20&c=KvnSucLQr-3ki0-cgifnkVvZ_Ba7X2Iu4BnNWoStAOQ=',
      status: '0',
      topics: [
      TopicsModel(
        id: 1,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Introducción',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: true,
        duration: const TimeOfDay(hour: 0,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 2,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 3,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 2',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 4,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 3',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 5,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 4',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
    ],
  ),
  CampusModel(
      id: 3,
      title: 'Título del curso 3',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
      image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
      status: '0',
      topics: [
      TopicsModel(
        id: 1,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Introducción',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: true,
        duration: const TimeOfDay(hour: 0,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 2,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 3,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 2',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 4,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 3',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 5,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 4',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
    ],
  ),
  CampusModel(
      id: 4,
      title: 'Título del curso 4',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
      image: 'https://media.istockphoto.com/id/2148239914/es/foto/group-of-diverse-friends-outdoors-on-picnic-talking-and-drinking-coffee-to-go.jpg?s=2048x2048&w=is&k=20&c=KvnSucLQr-3ki0-cgifnkVvZ_Ba7X2Iu4BnNWoStAOQ=',
      status: '0',
      topics: [
      TopicsModel(
        id: 1,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Introducción',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: true,
        duration: const TimeOfDay(hour: 0,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 2,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 3,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 2',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 4,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 3',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
      TopicsModel(
        id: 5,
        image: 'https://img.freepik.com/foto-gratis/paisaje-ciudad-analogica-edificios-luz-dia_23-2149661434.jpg',
        title: 'Tema 4',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.',
        isIntro: false,
        duration: const TimeOfDay(hour: 1,minute: 30),
        chapters: [
          ChaptersModel(
            id: 1,
            title: 'Contenido 1',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 2,
            title: 'Contenido 2',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 3,
            title: 'Contenido 3',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
          ChaptersModel(
            id: 4,
            title: 'Contenido 4',
            content: 'Lorem ipsum dolor sit amet consectetur. Aliquam turpis ante vitae urna senectus id quisque accumsan scelerisque. Nibh arcu consectetur odio amet amet pharetra consequat. Nibh sed cras risus enim adipiscing massa posuere. Amet est nulla purus sit. Lorem consectetur ac donec dictumst sed tristique dis congue. Sit dui sit laoreet vestibulum viverra ut tincidunt sagittis.',
            video: 'https://www.youtube.com/watch?v=sqkmEp7q7L8',
          ),
        ],
        questions: [
          QuestionTest(
              id: 1,
              content: '¿Lorem ipsum 1?',
              answer: 'd',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 2,
              content: '¿Lorem ipsum 2?',
              answer: 'b',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 3,
              content: '¿Lorem ipsum 3?',
              answer: 'a',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
          QuestionTest(
              id: 4,
              content: '¿Lorem ipsum 4?',
              answer: 'c',
              question: [
                'a',
                'b',
                'c',
                'd'
              ]
          ),
        ],
      ),
    ],
  ),
];*/