package org.project.library.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "rent_info")
public class RentInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rent_id")
    private Long rentId;

    @Column(name = "status")
    private String status;

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

    public Long getRentId() {
        return rentId;
    }

    public void setRentId(Long rentId) {
        this.rentId = rentId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
                "rentId=" + rentId +
                ", status='" + status + '\'' +
                ", reader=" + reader +
                ", book=" + book +
                ", dateOfRent=" + dateOfRent +
                '}';
    }
}
