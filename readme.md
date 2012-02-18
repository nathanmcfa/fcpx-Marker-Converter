# Final Cut Pro X Marker Converter

FCPX currently doesn't export markers to Compressor... super lame! This app converts markers from a .fcpxml file to a .txt file that can be imported into compressor.

## Known issues

In order for this to work, you need need to have your entire project in a single compound clip. ie:  Select All => "New Compound Clip". 

Create your makers on the global compound clip. 

I'm currently working to fix this issue.

## Usage

### Export project xml file
In the Final Cut Pro X project browser, highlight a project and select "File" => "Export XML".

### Convert .fcpxml to markers.txt

Option 1 - Open Markers.app. Select your .fcpxml file. Save your markers text file

Option 2 - Drag your .fcpxml file onto the Markers.app icon. You'll be asked where to save the markers text file.

### Import into Compressor
In the Compressor preview window, click the marker button and select "Import Chapter Marker List". Select your markers text file, and BOOM! Markers imported. 

## Notes
This app finds all markers within the entire project, even those within compound clips.

Please post any issues - better yet, send a pull request!