<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Root element of the stylesheet -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Converted XML to HTML</title>
                <style type="text/css">
                    table {
                        font-family: "Helvetica", "Arial", sans-serif;
                        border-collapse: collapse;
                        width: 100%;
                    }
                    th, td {
                        border: 1px solid #8A8A8A;
                        text-align: left;
                        padding: 8px;
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>Converted Table</h2>
                <table>
                    <thead>
                        <tr>
                            <!-- Adjust these according to the XML structure -->
                            <th>Column 1</th>
                            <th>Column 2</th>
                            <th>Column 3</th>
                            <th>Column 4</th>
                            <th>Column 5</th>
                            <th>Column 6</th>
                            <th>Column 7</th>
                            <th>Column 8</th>
                            <th>Column 9</th>
                            <th>Column 10</th>
                            <th>Column 11</th>
                            <th>Column 12</th>
                            <th>Column 13</th>
                            <th>Column 14</th>
                            <th>Column 15</th>
                            <th>Column 16</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Loop through each row in the XML file -->
                        <xsl:for-each select="//ROW">
                            <tr>
                                <!-- Loop through each cell in the current row -->
                                <xsl:for-each select="*">
                                    <td>
                                        <xsl:value-of select="."/>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
