# document-detector
Automatically Detecting a Document in an image. (Evernote Camera Application ).

The algorithm presented above automatically detects a document inside an image irrespective of the real time challenges that occur such as:
1) Illumination Variations.
2) Orientation of the Document.
3) Target document on top of multiple documents.

The basic idea of this algorithm is to pre-process the image and apply Canny Edge Detector and Hough Transform and applying some post processing
to it to get our desired results.

How to Run:
1) To run the algorithm just open the project in matlab and run auto_crop. This gives us the results from the given dataset.
