class Week {
  final int numberWeek;
  final List<Task> tasks;

  Week({
    required this.numberWeek,
    required this.tasks,
  });
}

class Task {
  final int id;
  final String title;
  final bool? done;
  final Function() goTo;

  Task({
    required this.id,
    required this.title,
    required this.goTo,
     this.done,
  });
}
