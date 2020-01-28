package org.project.library.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Entity
@Table(name = "librarian")
public class Librarian {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @NotNull(message = "Please provide a valid first name")
    @Pattern(regexp = "[\\-a-zA-Z\\s.]+", message = "Please provide a valid first name")
    @Size(min = 2, max = 20, message = "Must not be shorter than 2 and longer than 20 characters")
    @Column(name = "first_name")
    private String firstName;

    @NotNull(message = "Please provide a valid last name")
    @Pattern(regexp = "[\\-a-zA-Z\\s.]+", message = "Please provide a valid last name")
    @Size(min = 2, max = 20, message = "Must not be shorter than 2 and longer than 20 characters")
    @Column(name = "last_name")
    private String lastName;

    @NotNull(message = "Please provide a valid phone number")
    @Pattern(regexp = "\\(\\d{3}\\)\\d{3}-\\d{4}", message = "Please provide a valid phone number format. Must be like (000)000-0000")
    @Column(name = "phone")
    private String phone;

    @NotNull(message = "Please provide a valid address")
    @Column(name = "address")
    private String address;

    @NotNull(message = "Please provide a valid email")
    @Pattern(regexp = "^[A-Za-z0-9+_.-]+@(.+)$", message = "Please provide a valid email format")
    @Column(name = "email")
    private String email;

    @NotNull(message = "Please provide a valid date of birth")
    @Pattern(regexp = "([0-9]{2})-([0-9]{2})-([0-9]{4})", message = "Wrong data format. Must be dd-mm-yyyy")
    @Column(name = "date_of_birth")
    private String dateOfBirth;

    @Column(name = "gender")
    private String gender;

    @NotNull(message = "Please provide a valid date of birth")
    @Pattern(regexp = "([0-9]{2})-([0-9]{2})-([0-9]{4})", message = "Wrong data format. Must be dd-mm-yyyy")
    @Column(name = "registration_date")
    private String registrationDate;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }

    @Override
    public String toString() {
        return "Librarian{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", gender='" + gender + '\'' +
                ", registrationDate=" + registrationDate +
                '}';
    }
}
