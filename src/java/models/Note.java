package models;

import java.io.Serializable;

public class Note implements Serializable {
    private int noteId;
    private String title;
    private String contents;
    private String owner;

    public Note() {
    }

    public Note(int noteId, String title, String contents, String owner) {
        this.noteId = noteId;
        this.title = title;
        this.contents = contents;
        this.owner = owner;
    }

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }
    

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
}
