April 15, 2024


Using XPath
==================

* on-line test page: https://extendsclass.com/xpath-tester.html

* functions: https://developer.mozilla.org/en-US/docs/Web/XPath/Functions

To find an XPath selector with Safari,

1. view the page
2. open dev tools
3. select element
4. in html pane of dev tools, right-click the element you want
5. in context menu, Copy -> XPath

Notes
------------------

    //			find anywhere

    /			force start at root

    /div/*/a		find all anchors that are grandchildren of a div

Examples
-----------

Given this XML:

    <div>
      <div>
        <a href="/x/b">b</a>
        <a href="/y/abc">abc</a>
        <a href="/x/abcd">abcd</a>
      </div>
    </div>


//a[contains(@href, "/x/")]

    <a href="/x/b">b</a>
    <a href="/x/abcd">abcd</a>


/a

	Nothing

//a

    <a href="/x/b">b</a>
    <a href="/y/abc">abc</a>
    <a href="/x/abcd">abcd</a>


/div/*/a

    <a href="/x/b">b</a>
    <a href="/y/abc">abc</a>
    <a href="/x/abcd">abcd</a>


/*/a

	Nothing
