package services;

import dataaccess.NoteDB;
import java.util.List;
import models.Note;

public class NoteService {
    public Note get(int id) throws Exception {
        NoteDB noteDB = new NoteDB();
        Note note = noteDB.get(id);
        return null;
    }
    
    public List<Note> getAll(String email) throws Exception {
        NoteDB noteDB = new NoteDB();
        List<Note> notes = noteDB.getAll(email);
        return notes;
    }
    
    public void insert(String title, String contents, String owner) throws Exception {
        Note note = new Note(0, title, contents, owner);
        NoteDB noteDB = new NoteDB();
        noteDB.insert(note);
    }
    
    public void update(int noteId, String title, String contents, String owner) throws Exception {
        Note note = new Note(noteId, title, contents, owner);
        NoteDB noteDB = new NoteDB();
        noteDB.update(note);
    }
    
    public void delete(int noteId) throws Exception {
        Note note = new Note();
        note.setNoteId(noteId);
        NoteDB noteDB = new NoteDB();
        noteDB.delete(note);
    }
}
