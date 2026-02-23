# Maven Quick Run 

Maven is kinda bloated

Sometimes you just want to run a `.java` file with a `main` method and see the `System.out.println` output without dealing with Maven's silent TDD test phases. This script does exactly that, and it even auto-compiles your latest changes before running.

---

## Arguments

To run a class, provide the following:

1. **Fully Qualified Name (Required):** The `package` + `ClassName`.
2. **Scope (Optional):** Which part of the project the class lives in (`compile` for `src/main`, `test` for `src/test`).
   - **Smart Default:** If you leave this blank, the script assumes `test` if your class name ends in "Test". Otherwise, it defaults to `compile`.

---

## Example Project Structure

Assuming you have a standard Maven layout like this:

```
my-project/
├── pom.xml
├── src/
│   ├── main/java/com/rildian/classes/GuessGame/
│   │   └── GameLauncher.java      <-- Standard main class
│   │
│   └── test/java/com/rildian/classes/
│       └── MovieTest.java         <-- Test class with a main() method
```

---

## Usage

Make sure the script is executable (`chmod +x run_java.sh`).

**1. Run a main application class (Auto-detects `compile` scope):**
```bash
./run_java.sh com.rildian.classes.GuessGame.GameLauncher
```

**2. Run a test class (Auto-detects `test` scope because of the "Test" suffix):**
```bash
./run_java.sh com.rildian.classes.MovieTest
```

**3. Override the scope manually (if your test class doesn't end in "Test"):**
```bash
./run_java.sh com.rildian.classes.WeirdName test
```


