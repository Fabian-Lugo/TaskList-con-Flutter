class TaskItem {
  final String title;
  final int? id;
  bool isDone;

  TaskItem({required this.title, this.id, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      if (id != null) 'id': id,
      'isDone': isDone,
    };
  }

  factory TaskItem.fromMap(Map<String, dynamic> map) {
    return TaskItem(
      title: map['title'],
      id: map['id'] as int?,
      isDone: map['isDone'] == true || map['isDone'] == 1,
    );
  }
}