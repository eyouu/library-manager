package org.project.library.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "rent_info")
public class RentInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    // rent by
    @ManyToOne
    @JoinColumn(name = "librarian_id")
    private Librarian librarian;

    // to whom
    @ManyToOne
    @JoinColumn(name = "reader_id")
    private Reader reader;

    // book id
    @ManyToOne
    @JoinColumn(name = "book_id")
    private Book book;

    @Temporal(TemporalType.DATE)
    @Column(name = "date_of_rent")
    private Date dateOfRent;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Librarian getLibrarian() {
        return librarian;
    }

    public void setLibrarian(Librarian librarian) {
        this.librarian = librarian;
    }

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Date getDateOfRent() {
        return dateOfRent;
    }

    public void setDateOfRent(Date dateOfRent) {
        this.dateOfRent = dateOfRent;
    }

    @Override
    public String toString() {
        return "RentInfo{" +
                "id=" + id +
                ", librarian=" + librarian +
                ", reader=" + reader +
                ", book=" + book +
                ", dateOfRent=" + dateOfRent +
                '}';
    }
}
