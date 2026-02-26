class TaskItem {
  final String title;
  final int? id;
  bool isDone;

  TaskItem({required this.title, this.id, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'title' : title,
      'id' : id,
      'isDone' : isDone ? 1 : 0,
    };
  }

  factory TaskItem.fromMap(Map<String, dynamic> map) {
    return TaskItem(
      title: map['title'],
      id: map['id'],
      isDone: map['isDone'] == 1,
    );
  }
}