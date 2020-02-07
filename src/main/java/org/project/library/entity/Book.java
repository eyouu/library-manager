package org.project.library.entity;


import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "book")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @NotNull(message = "Please provide a valid author")
    @Pattern(regexp = "[\\-a-zA-Z\\s.']+", message = "Please provide a valid author")
    @Size(min = 2, max = 50, message = "Must not be shorter than 2 and longer than 50 characters")
    @Column(name = "author")
    private String author;

    @NotNull(message = "Please provide a valid title")
    @Size(min = 1, max = 80, message = "Must not be shorter than 1 and longer than 80 characters")
    @Column(name = "title")
    private String title;

    @NotNull(message = "Please provide a valid genre")
    @Pattern(regexp = "[\\-a-zA-Z\\s.,]+", message = "Please provide a valid genre")
    @Size(min = 2, max = 30, message = "Must not be shorter than 2 and longer than 30 characters")
    @Column(name = "genre")
    private String genre;

    @Pattern(regexp = "[\\-a-zA-Z\\s]+", message = "Please provide a valid country")
    @Size(min = 3, max = 56, message = "Must not be shorter than 4 and longer than 56 characters")
    @Column(name = "country")
    private String country;

    @NotNull(message = "Please provide a valid publication date")
    @Pattern(regexp = "([0-9]{4})-([0-9]{2})-([0-9]{2})", message = "Wrong data format. Must be yyyy-mm-dd")
    @Column(name = "publication_date")
    private String publicationDate;

    @NotNull(message = "Please provide a valid quantity")
    @Min(value = 0, message = "Minimum 0")
    @Column(name = "quantity")
    private Integer quantity;

    @OneToMany(mappedBy = "book", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<RentInfo> rentInfo;

    @ManyToMany(fetch = FetchType.LAZY,
            cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH })
    @JoinTable(
            name = "book_reader",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "reader_id")
            )
    private List<Reader> readers = new ArrayList<>();

    public Book() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public List<RentInfo> getRentInfo() {
        return rentInfo;
    }

    public void setRentInfo(List<RentInfo> rentInfo) {
        this.rentInfo = rentInfo;
    }

    public List<Reader> getReaders() {
        return readers;
    }

    public void setReaders(List<Reader> readers) {
        this.readers = readers;
    }

    public void addReader(Reader reader) {
        this.readers.add(reader);
    }

    public void removeReader(Reader reader) {
        this.readers.remove(reader);
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", author='" + author + '\'' +
                ", title='" + title + '\'' +
                ", genre='" + genre + '\'' +
                ", country='" + country + '\'' +
                ", publicationDate='" + publicationDate + '\'' +
                ", quantity=" + quantity +
                ", rentInfo=" + rentInfo +
                ", readers=" + readers +
                '}';
    }
}
