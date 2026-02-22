# Java Automatic Setup 
Create or update a Java project - create a java project from scratch (setting up folders, libs and etc) or even updating (inserting more libs).

## Dependencies 
- Maven
- Sed 
- Bash (duh)
- Java (duh)


## Usage 
Give permission to all scripts: 
```bash 
cd src/
./permission.sh 
```

After that, execute 
```
cd .. 
./main.sh
```

There will be a menu of usage. If you'd like to create a java project
from scratch and don't want to use the bloated maven CLI, select the 
option 1. 

Provide:
- The directory 
- The name of the organization/project 
- The name of the project 
- And the Java version 

Now, if you want to add a simple library, hit the option 2.

Provide: 
- The directory of the project 
- Paste the dependency block, e.g:

```xml 
<dependency>
    <groupId>com.google.code.gson</groupId>
    <artifactId>gson</artifactId>
    <version>2.10.1</version>
</dependency>
```

And that's it. I am not handling parent stuff or things more complicated, just small dependencies. 
