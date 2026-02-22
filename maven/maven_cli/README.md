# Maven Quick Run 

Maven is kinda bloated

Sometimes you just want to run a `.java` file with a `main` method and see the `System.out.println`. This script does exactly that.

## Prerequisites
To run a class, you must provide two arguments:
1. **Fully Qualified Name:** The `package` + `ClassName`.
2. **Scope:** Which part of the project the class lives in (`compile` for main, `test` for tests).

---

## Example Project Structure

Assuming you have a standard Maven layout like this:

```text
my-project/
├── pom.xml
├── src/
│   ├── main/java/com/rildian/classes/
│   │   └── Movie.java
│   │
│   └── test/java/com/rildian/classes/
│       └── MovieTest.java (Contains your main() method) 
--- 
``` 

## Usage

To run a test class (can access both src/main and src/test):
```
./script.sh com.rildian.classes.MovieTest test
```

To run a main application class (only accesses src/main):
```
./script.sh com.rildian.classes.Movie compile
```
