// Some basic file handle operations
// Assumes the existence of a file called "testfile"
// in the current working directory

//page 423
#import <Foundation/Foundation.h>

int main (int argc, char * argv[]) {
    @autoreleasepool {
        
        NSString *path;  //used to run through enumerator
        NSFileManager *fm;  //filemanager object
        NSDirectoryEnumerator *dirEnum;  //stores directory/file structure
        NSString *searchFile;  //stores filename to search for
        NSString *curFile; //stores the current file incrementing through the enumerated file array
        NSString *origDir; //stores the initial search location for printing out at the end
      //  NSString *searchConcat;
        int success=2;
        
        
        fm = [NSFileManager defaultManager];  //create filemanager object
        path = [NSString stringWithFormat:@"%s", argv[1]];  //get search path from user
        searchFile = [NSString stringWithFormat:@"%s", argv[2]];  //get file to search for from user
        dirEnum = [fm enumeratorAtPath:path];  //stores directory enumeration
        origDir = path;
        //searchConcat = [NSString stringWithFormat:@"%@/%@",curFile,searchFile];  //example of concatenating strings in obj c
        
        NSLog(@"Beginning of search for %@ in %@", searchFile,path);
        
        while((path = [dirEnum nextObject])){
            curFile = [path lastPathComponent];
            
            if([curFile isEqualToString:searchFile]){
                NSLog(@"Success!@#$ file located at %@/%@",origDir,path);
                success = 0;
                break;
            
            } else {
                success = 1;
            }//end else
        }//end while
        
        if(success==1)
           NSLog(@"could NOT locate file!@#$");
        
    }//end autorelease
    return 0;
    
}//end main

