<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>XML to HTML Transformation</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid black;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <!-- Process all steps in the order they appear -->
                <xsl:for-each select="//step">
                    <xsl:choose>
                        <xsl:when test="message_type='OrderClearingCheck'">
                            <h2><xsl:value-of select="description"/></h2>
                            <xsl:apply-templates select="." mode="OrderClearingCheck"/>
                        </xsl:when>
                        <xsl:when test="message_type='GetAllCollateralPositions'">
                            <h2><xsl:value-of select="description"/></h2>
                            <xsl:apply-templates select="." mode="GetAllCollateralPositions"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for OrderClearingCheck in mode OrderClearingCheck -->
    <xsl:template match="step" mode="OrderClearingCheck">
        <table>
            <tr>
                <th>Execute</th>
                <th>Service Name</th>
                <th>Timeout</th>
                <th>Action</th>
                <th>Description</th>
                <th>Request ID</th>
                <th>Order ID</th>
                <th>Order Direction</th>
                <th>Sent to Clearing At (Seconds)</th>
                <th>Sent to Clearing At (Nanos)</th>
                <th>Connection ID</th>
            </tr>
            <tr>
                <td><xsl:value-of select="execute"/></td>
                <td><xsl:value-of select="service_name"/></td>
                <td><xsl:value-of select="timeout"/></td>
                <td><xsl:value-of select="action"/></td>
                <td><xsl:value-of select="description"/></td>
                <td><xsl:value-of select="message/request_id"/></td>
                <td><xsl:value-of select="message/order/order_id"/></td>
                <td><xsl:value-of select="message/order/order_direction"/></td>
                <td><xsl:value-of select="message/sent_to_clearing_at/seconds"/></td>
                <td><xsl:value-of select="message/sent_to_clearing_at/nanos"/></td>
                <td><xsl:value-of select="message/connection_id"/></td>
            </tr>
        </table>
    </xsl:template>
    
    <!-- Template for GetAllCollateralPositions in mode GetAllCollateralPositions -->
    <xsl:template match="step" mode="GetAllCollateralPositions">
        <table>
            <tr>
                <th>Execute</th>
                <th>Service Name</th>
                <th>Timeout</th>
                <th>Action</th>
                <th>Description</th>
                <th>Request ID</th>
                <th>Collateral Register ID</th>
                <th>Collateral Position Type</th>
                <th>Asset ID</th>
                <th>Incoming Position</th>
                <th>Credited</th>
                <th>Written Off</th>
                <th>Default Obligations</th>
                <th>Funds for Goods</th>
                <th>Current Position</th>
                <th>Margin Requirement Placed</th>
                <th>Margin Requirement Current</th>
                <th>Margin Requirement Unfulfilled</th>
                <th>Clearing Member Organization ID</th>
            </tr>
            <tr>
                <td><xsl:value-of select="execute"/></td>
                <td><xsl:value-of select="service_name"/></td>
                <td><xsl:value-of select="timeout"/></td>
                <td><xsl:value-of select="action"/></td>
                <td><xsl:value-of select="description"/></td>
                <td><xsl:value-of select="message/request_id"/></td>
                <td><xsl:value-of select="message/collateral_position/collateral_position_opened_in_collateral_register_id"/></td>
                <td><xsl:value-of select="message/collateral_position/col_pos_type"/></td>
                <td><xsl:value-of select="message/collateral_position/asset_id"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/incoming_pos"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/credited"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/written_off"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/def_obligations"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/funds_for_goods"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/current_pos"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/margin_requir_placed"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/margin_requir_current"/></td>
                <td><xsl:value-of select="message/collateral_position/reg_sec_in_units/margin_requir_unfull"/></td>
                <td><xsl:value-of select="message/collateral_position/clearing_member_organization_id"/></td>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>
