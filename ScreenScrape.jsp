<html>
<head>
<title>Top Movies</title>
</head>
<style>

body {
	background-color: #ADD8E6;
}

table {
    font-family: arial, sans-serif;
    border: 2;
    border-color: #000000

}
td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
tr:nth-child(odd) {
    background-color: #7CFC00;
}
div.container {
    width:100%;
    overflow:auto;
}
div.table-div {
    width:40%;
    float:left;
    
}
div.title-div {
    width:60%;
    float:right;

}

</style>
<body>

<%@ page import="java.util.*" %>
   <%@ page import="java.io.*" %>
   <%@ page import="org.jsoup.*" %>
   <%@ page import="org.jsoup.nodes.*" %>
   <%@ page import="org.jsoup.parser.*" %>
   <%@ page import="org.jsoup.select.*" %>
<%
/**
 *
 * @author William
 */


            Document webPage=null;
            Document webPage2=null;
            String docURL="http://www.imdb.com/chart/top";
            String docURL2="https://en.wikipedia.org/wiki/AFI's_100_Years...100_Movies";
            String line;
            out.println("<h1>IMDB Top 20 Movies"	+"<div class='title-div'>" + "Wikipedia Top 20 Movies</h1></div>");
            Connection c=Jsoup.connect(docURL);
            webPage = c.get();
            Elements tables = webPage.getElementsByTag("tr");
                 
            int i =0;
			


	    out.print("<div class='container'><div class='table-div'><table><tr><th>Cover Image</th><th>Movie Title</th><th>Rating</th></tr>");
            for(Element anchor:tables)
            { 
                i++;
		if(i != 1)
		{
                out.println("<tr><td  height = 80px>" + anchor.child(0).html() + "</td><td>" + anchor.child(1).text() + "</td><td> " + anchor.child(2).text() + "</td></tr>");
              
		}
                if(i>20){
                    break;
                }
	    }
		i=0;
	    out.println("</table>");
		//Second Table
		Connection c2=Jsoup.connect(docURL2);
        webPage2 = c2.get();
        Elements tables2 = webPage2.select("table tr");
            
		out.print("</div><div class='table-div'> <table><tr><th>Ranking</th><th>Movie Title</th><th>Release Year</th></tr>");
            for(Element anchor:tables2)
            { 
                i++;
		if(i >15)
		{
		int j=i-15;
                out.println("<tr><td height = 85px >" + j + "</td><td>" + anchor.child(0).text() + "</td><td>" + anchor.child(1).text() + "</td></tr>");
              
		}
                if(i>34){
                    break;
                }
	    }
	    out.println("</table></div></div>");
             
                    
           

           
            

              
            
    
%>

</body>
</html>
