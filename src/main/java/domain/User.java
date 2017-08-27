package domain;

public class User {

    private String userId;
    private String usernamename;
    private String password;
    private int age;
    private long index;

    public User(String userId, String usernamename, String password, int age) {
        this.userId = userId;
        this.usernamename = usernamename;
        this.password = password;
        this.age = age;
        this.index = 0;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsernamename() {
        return usernamename;
    }

    public void setUsernamename(String usernamename) {
        this.usernamename = usernamename;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public long getIndex() {
        return index;
    }

    public void setIndex(long index) {
        this.index = index;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        User other = (User) obj;
        if (userId == null) {
            if (other.userId != null)
                return false;
        } else if (!userId.equals(other.userId))
            return false;
        return true;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((userId == null) ? 0 : userId.hashCode());
        return result;
    }
    @Override
    public String toString() {
        return "User [userId=" + userId + ", name=" + usernamename + "]";
    }
}