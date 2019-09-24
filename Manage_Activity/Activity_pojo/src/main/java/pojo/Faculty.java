package pojo;

import java.io.Serializable;

public class Faculty implements Serializable
{
    private Integer id;

    private String facultyname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFacultyname() {
        return facultyname;
    }

    public void setFacultyname(String facultyname) {
        this.facultyname = facultyname == null ? null : facultyname.trim();
    }
}