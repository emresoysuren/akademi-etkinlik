import 'package:uuid/uuid.dart';

/// The Forms will be stored as Map values
///
/// And the key'll be store its id before the "#"
/// and after the hash the key'll be store its type.
///
/// And the end result'll look like this:
/// <id>#<type> : <content>
///

class EventForm {
  Map<String, dynamic> formData;
  List formIds;

  EventForm({List? ids, Map<String, dynamic>? data})
      : formData = data ?? {},
        formIds = ids ?? [];

  EventForm.fromMap(Map m) : this(ids: m["ids"], data: m["data"]);

  Map<String, Object> toMap() {
    return {"ids": formIds, "data": formData};
  }

  // Form Functions
  addItem(FormInput formInput, String content, [String? uuid]) {
    uuid ??= const Uuid().v4();
    if (formIds.contains(uuid)) return addItem(formInput, content);
    formIds.add(uuid);
    formData.addAll({"$uuid#$formInput": content});
  }

  addItemTo(int index, FormInput formInput, String content, [String? uuid]) {
    if (uuid == null) {
      uuid ??= const Uuid().v4();
      if (formIds.contains(uuid)) return addItemTo(index, formInput, content);
    } else {
      if (formIds.contains(uuid)) return;
    }
    final newOrder = [
      ...formIds.getRange(0, index),
      uuid,
      ...formIds.getRange(index, formIds.length)
    ];
    formIds = newOrder;
    formData.addAll({"$uuid#$formInput": content});
  }

  editItemAt(int index, String content) {
    if (formIds.length < index + 1) return null;
    final String uuid = formIds[index];
    final String key = formData.keys.firstWhere(
      (element) => element.contains("$uuid#"),
      orElse: () => "",
    );
    if (key.isEmpty) return;
    formData.update(key, (value) => content);
  }

  changeItemAt(int index, FormInput formInput, String content) {
    if (formIds.length < index + 1) return null;
    final String uuid = formIds[index];
    formData.removeWhere((key, value) => key.contains("$uuid#"));
    formIds.remove(uuid);
    addItemTo(index, formInput, content, uuid);
  }

  removeItemAt(int index) {
    final String uuid = formIds[index];
    formData.removeWhere((key, value) => key.contains("$uuid#"));
  }

  Map<String, String?>? elementAt(int index) {
    if (formIds.length < index + 1) return null;
    final String uuid = formIds[index];
    final String key = formData.keys.firstWhere(
      (element) => element.contains("$uuid#"),
      orElse: () => "",
    );
    if (key.isEmpty) return null;
    final String? value = formData[key];
    return {key.split("#").last: value};
  }

  FormInput? elementTypeAt(int index) {
    if (formIds.length < index + 1) return null;
    final String uuid = formIds[index];
    final String key = formData.keys.firstWhere(
      (element) => element.contains("$uuid#"),
      orElse: () => "",
    );
    if (key.isEmpty) return null;
    if (key.split("#")[1] == FormInput.question.toString()) {
      return FormInput.question;
    }
    if (key.split("#")[1] == FormInput.text.toString()) return FormInput.text;
    if (key.split("#")[1] == FormInput.star.toString()) return FormInput.star;
    if (key.split("#")[1] == FormInput.checkBox.toString()) {
      return FormInput.checkBox;
    }
    return null;
  }

  String? elementConentAt(int index) {
    if (formIds.length < index + 1) return null;
    final String uuid = formIds[index];
    final String key = formData.keys.firstWhere(
      (element) => element.contains("$uuid#"),
      orElse: () => "",
    );
    if (key.isEmpty) return null;
    final String? value = formData[key];
    if (value == null) return null;
    return value;
  }
}

enum FormInput {
  question,
  text,
  star,
  // radioButton,
  checkBox;

  @override
  String toString() => name;
}
