import 'dart:async';
import '../models/note.dart';

class NoteService {
  // Singleton pattern
  static final NoteService _instance = NoteService._internal();
  factory NoteService() => _instance;
  NoteService._internal();

  // Mock in-memory storage
  final List<Note> _notes = [
    Note(
      id: '1',
      title: 'Welcome to your Notebook',
      content: 'This is a sample note. You can edit or delete it. Tap the + button to create a new note.',
      createdAt: DateTime.now(),
    ),
    Note(
      id: '2',
      title: 'Ideas',
      content: '- Learn Flutter\n- Build a cool app\n- Integrate Supabase',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  Future<List<Note>> getNotes() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    // Return sorted by date (newest first)
    _notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return List.from(_notes);
  }

  Future<void> addNote(Note note) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _notes.add(note);
  }

  Future<void> updateNote(Note note) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      _notes[index] = note;
    }
  }

  Future<void> deleteNote(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _notes.removeWhere((n) => n.id == id);
  }
}
