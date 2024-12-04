
class CampusModel {
  int id;
  String title;
  String slug;
  String tags;
  String subtitle;
  String image;
  int homeAppearance;
  String description;
  String presentationText;
  String requirementImage;
  String requirementImageName;
  String requirementImageDescription;
  String requirementTitle;
  String requirementDescription;
  bool completed;
  int quantityTopics;

  CampusModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.tags,
    required this.subtitle,
    required this.image,
    required this.homeAppearance,
    required this.description,
    required this.presentationText,
    required this.requirementImage,
    required this.requirementImageName,
    required this.requirementImageDescription,
    required this.requirementTitle,
    required this.requirementDescription,
    required this.completed,
    required this.quantityTopics,
  });

  factory CampusModel.fromJson(dynamic json) => CampusModel(
    id: json["id"] ?? 0,
    title: json["title"] ?? '',
    slug: json["slug"] ?? '',
    tags: json["tags"] ?? '',
    subtitle: json["subtitle"] ?? '',
    image: json["image"] ?? '',
    homeAppearance: json["home_appearance"] ?? 0,
    description: json["description"] ?? '',
    presentationText: json["presentation_text"] ?? '',
    requirementImage: json["requirement_image"] ?? '',
    requirementImageName: json["requirement_image_name"] ?? '',
    requirementImageDescription: json["requirement_image_description"] ?? '',
    requirementTitle: json["requirement_title"] ?? '',
    requirementDescription: json["requirement_description"] ?? '',
    completed: json["completed"] ?? false,
    quantityTopics: json["quantity_topics"] ?? 1
  );
}

class TopicsModel {
  int id;
  String title;
  String slug;
  String tags;
  String subtitle;
  String description;
  String image;
  String duration;
  bool requireTest;
  bool completed;
  int courseId;
  List<ChaptersModel> sections;

  TopicsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.tags,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.duration,
    required this.requireTest,
    required this.completed,
    required this.courseId,
    this.sections = const [],
  });

  factory TopicsModel.fromJson(dynamic json) => TopicsModel(
    id: json["id"] ?? 0,
    title: json["title"] ?? '',
    slug: json["slug"] ?? '',
    tags: json["tags"] ?? '',
    subtitle: json["subtitle"] ?? '',
    description: json["description"] ?? '',
    image: json["image"] ?? '',
    duration: json["duration"] ?? '',
    requireTest: json["require_test"] ?? false,
    completed: json["completed"] ?? false,
    courseId: json["course_id"] ?? 0,
    sections: json["sections"] == null ? [] : (json["sections"] as List).map((e) => ChaptersModel.fromJson(e)).toList(),
  );
}

class ChaptersModel {
  int id;
  String title;
  String subtitle;
  String description;
  String video;
  int topicId;
  String createsAt;
  String updateAt;

  ChaptersModel({
    required this.id,
    required this.subtitle,
    required this.title,
    required this.description,
    required this.video,
    required this.topicId,
    required this.createsAt,
    required this.updateAt,
  });

  factory ChaptersModel.fromJson(dynamic json) => ChaptersModel(
    id: json["id"] ?? 0,
    subtitle: json["subtitle"] ?? '',
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    video: json["video"] ?? '',
    topicId: json["topicId"] ?? 0,
    createsAt: json["createsAt"] ?? '',
    updateAt: json["updateAt"] ?? '',
  );
}

class QuestionTest {
  int id;
  String image;
  int topicId;
  String question;
  List<OptionTest> options;

  QuestionTest({
    required this.id,
    required this.image,
    required this.topicId,
    required this.question,
    required this.options,
  });

  factory QuestionTest.fromJson(dynamic json){

    List<OptionTest> options = [];
    List listOption = json["options"] as List;
    for(int x = 0; x < listOption.length; x++){
      OptionTest opt = OptionTest.fromJson(listOption[x]);
      opt.line = x;
      options.add(opt);
    }
    return QuestionTest(
      id: json["id"] ?? 0,
      image: json["image"] ?? '',
      topicId: json["topic_id"] ?? '',
      question: json["question"] ?? '',
      options: options,
    );
  }
}

class OptionTest {
  String optionValue;
  bool correctAnswer;
  int line;

  OptionTest({
    required this.optionValue,
    required this.correctAnswer,
    this.line = 0,
  });

  factory OptionTest.fromJson(dynamic json) => OptionTest(
    optionValue: json["option_value"] ?? '',
    correctAnswer: json["correct_answer"] ?? false,
  );
}

class TestResult {
  int id;
  int correctAnswer;
  int incorrectAnswer;
  List<TestResultQuestion> questionsAnswered;

  TestResult({
    required this.id,
    required this.correctAnswer,
    required this.incorrectAnswer,
    this.questionsAnswered = const [],
  });

  factory TestResult.fromJson(dynamic json){
    return TestResult(
      id: json["id"] ?? 0,
      correctAnswer: json["correct_answers"] ?? 0,
      incorrectAnswer: json["incorrect_answers"] ?? 0,
      questionsAnswered : json["questions_answered"] == null ? [] : (json["questions_answered"] as List).map((e) => TestResultQuestion.fromJson(e)).toList()
    );
  }
}

class TestResultQuestion {
  int questionId;
  String question;
  String selectedOption;
  List<TestResultQuestionOption> options = const [];

  TestResultQuestion({
    required this.questionId,
    required this.question,
    required this.selectedOption,
    this.options = const [],
  });

  factory TestResultQuestion.fromJson(dynamic json){
    return TestResultQuestion(
      questionId: json["question_id"] ?? 0,
      question: json["question"] ?? '',
      selectedOption: json["selected_option"] ?? '',
      options :  json["options"] == null ? [] : (json["options"] as List).map((e) => TestResultQuestionOption.fromJson(e)).toList()
    );
  }
}

class TestResultQuestionOption {
  String optionValue;
  bool correctAnswer;
  bool selectedOption;

  TestResultQuestionOption({
    required this.optionValue,
    required this.correctAnswer,
    required this.selectedOption,
  });

  factory TestResultQuestionOption.fromJson(dynamic json){
    return TestResultQuestionOption(
      optionValue: json["option_value"] ?? '',
      correctAnswer: json["correct_answer"] ?? false,
      selectedOption: json["selected_option"] ?? false,
    );
  }
}