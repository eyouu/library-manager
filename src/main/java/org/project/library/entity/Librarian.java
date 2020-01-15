package org.project.library.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "librarian")
public class Librarian {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "librarian_detail_id")
    private LibrarianDetail librarianDetail;

    @OneToMany(mappedBy = "librarian", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private List<RentInfo> rentInfo;

    public Librarian() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public LibrarianDetail getLibrarianDetail() {
        return librarianDetail;
    }

    public void setLibrarianDetail(LibrarianDetail librarianDetail) {
        this.librarianDetail = librarianDetail;
    }

    public List<RentInfo> getRentInfo() {
        return rentInfo;
    }

    public void setRentInfo(List<RentInfo> rentInfo) {
        this.rentInfo = rentInfo;
    }

    @Override
    public String toString() {
        return "Librarian{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", librarianDetail=" + librarianDetail +
                ", rentInfo=" + rentInfo +
                '}';
    }
}
