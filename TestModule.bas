Attribute VB_Name = "TestModule"
Option Explicit

'==============================================================================
' NOTES: CURRENTLY THIS CLASS IS IN THE EARLY DESIGN STAGES. TESTING IS STILL
' GOING ON, AS WELL AS ADDING MORE FUNCTIONS.
'==============================================================================
Private Sub testClassArrays()
  
    Dim A As New cArray
    Dim standardArray As Variant 'USED FOR TESTING
    
    
    'ADD VALUES TO END OF CLASS ARRAY
    A.push "apple"
    A.push "bannana"
    
    
    'REMOVE VALUES FROM END OF CLASS ARRAY (RETURNS ITEM REMOVED(BANNANA))
    Debug.Print A.pop
    
    
    'ADD VALUES TO THE START OF THE CLASS ARRAY
    A.unshift "bannana"
    A.unshift "mango"
    
    
    'REMOVE VALUES FROM START OF THE ARRAY (RETURNS ITEM REMOVED(MANGO))
    Debug.Print A.shift
    
    
    'CHANGE VALUES BASED ON INDEX (WILL PUSH IF INDEX > UBOUND)(OPTION BASE 0)
    A(1) = "zeebra"
    
    
    'DISPLAY LENGHT OF CLASS ARRAY (ALWAYS ONE MORE THAN THE UBOUND)
    Debug.Print A.length
    A(A.length) = "apple" 'CAN FORCE A PUSH THIS WAY...
    
    
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' pArray IS THE ARRAY THAT IS STORED IN THE CLASS. IT IS PUBLIC,
    ' SO THAT IT CAN BE ACCESSED AND MANIPULATED OR USED IN DIFF WAYS.
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    
    'AT THIS POINT YOU ARE WORKING WITH A NORMAL ARRAY, SO LETS SET IT TO A VAR
    standardArray = A.pArray
    
    'EMPTY OUR CLASS ARRAY, FOR TESTING WE WILL ADD ONE NEW ITEM
    A.EmptyAndRedim
    
    A.push "carrot"
    
    'CONCATE RETURNS THE CURRENT ARRAY JOINED WITH ANOTHER ARRAY.
    'THIS EXAMPLE WILL SET THE pArray = TO CLASS ARRAY JOINED WITH THE STANDARD ARRAY
    A.pArray = A.concat(standardArray)
    
    
    'toString WILL RETURN THE ARRAY JOINED WITH COMMAS
    Debug.Print A.toString
    
    'YOU CAN ALSO SORT
    A.sort
    Debug.Print A.toString
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' MAPPING WILL USE EXCELS EVALUATE FUNCTION, TO TAKE A STRING AND DO
    ' BASIC FORMULAS TO EACH ITEM IN THE ARRAY, AND RETURN A NEW ARRAY.
    ' EXAMPLE BELOW IS UPPER CASE EACH ITEM. NOTE: {} IS WHERE THE ELEMENT WILL GO.
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    A.pArray = A.Map("upper({})")
    
    'LETS SEE THE RESULTS USING THE JOIN FUNCTION. (RUNS VBA JOIN FUNCTION)
    Debug.Print A.Join(", ")
    
    'EXAMPLES WITH NUMBERS
    A.EmptyAndRedim
    A.push 1
    A.push 2
    A.push 3
    
    A.pArray = A.Map("SUM(2 * {})")
    
    Debug.Print A.Join(", ")
    
    
End Sub
