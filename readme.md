# Final Cut Pro X Marker Converter

Forked from @Rockwood's great app.

Takes FCPX's xml format and strips it down to the chapter markers. 

## Usage

### Create Chapter Markers
In Final Cut Pro X, in the timeline press M to set a marker. In the resulting pop-up window, select the chapter type, and then drag the end marker to desired position.

#### NOTE: 
- A Chapter Marker's end CANNOT overlap another chapter marker, or it will cause an error in KZO.

### Export project xml file
In the Final Cut Pro X project browser, highlight a project and select "File" => "Export XML".

### Convert .fcpxml to markers.txt

Option 1 - Open Markers.app. Select your .fcpxml file. Save your chapter markers xml file

Option 2 - Drag your .fcpxml file onto the Markers.app icon. You'll be asked where to save the markers text file.

### Compressor Error Calibration

Some users experience a slight timing error when importing markers - especially when converting very long projects. If your markers are slightly off, select "Yes" to the dialog.

### Import into KZO

On the KZO Video details page, select Reupload Files, and then ChaptersXML file.

## Known issues

Due to an issue with the way FCPX deals with unused clips, It's recommended that you create your chapter markers as the final step in your workflow. Not doing so can result in markers being duplicated.


## Notes
This app finds all markers within the entire project, even those within compound clips.

Please post any issues