<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>XML Transform</title>
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
                    {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
  border-collapse: collapse;
  border: none;
}
 tbody tr:nth-child(odd) {
  background-color: #fff;
}
 tbody tr:nth-child(even) {
  background-color: #eee;
}
 td {
  padding: .5em;
  border: 1px solid #8A8A8A;
}
 th {
  font-size: 100%;
  text-align: right;
  padding: .5em;
  border: 1px solid #8A8A8A;
}
 caption {
  font-weight: bold;
  font-size: 18px;
  text-align: left;
}
                </style>
            </head>
            <body>
                
                <!-- Process all steps in the order they appear -->
                <h1>Стартовые данные</h1>
                <br/>
                <xsl:for-each select="//step">
                    <xsl:choose>
                        <xsl:when test="message_type='UploadStartData'">
                            <h2><xsl:value-of select="description"/></h2>
                            <xsl:apply-templates select="." mode="Organization"/>
                        </xsl:when>
                        <xsl:when test="message_type='UploadStartData'">
                            <h2><xsl:value-of select="description"/></h2>
                            <xsl:apply-templates select="." mode="Portfolio"/>
                        </xsl:when>
                    </xsl:choose>
                    <h2><xsl:value-of select="description"/></h2>
                    <xsl:apply-templates select="message_type='UploadStartData'" mode="Portfolio"/>
                </xsl:for-each>

                
                <h1>Ожидаемые результаты</h1>
                <br/>
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
            <caption>Запрос</caption>
            <thead>
                <tr>
                    <th class="col_heading level0">Описание</th>
                    <th class="col_heading level0">Тип сообщения</th>
                    <th class="col_heading level0">Операция</th>
                    <th class="col_heading level0">id запроса</th>
                    <th class="col_heading level0">id соединения</th>
                    <th class="col_heading level0">Идентификатор заявки</th>
                    <th class="col_heading level0">отправлено.seconds</th>
                    <th class="col_heading level0">отправлено.nanos</th>
                    <th class="col_heading level0">Направление заявки</th>
                    <th class="col_heading level0">Идентификатор организации – участника торгов, подавшего заявку</th>
                    <th class="col_heading level0">Идентификатор позиционного регистра, с указанием которого подана заявка</th>
                    <th class="col_heading level0">Идентификатор финансового инструмента для заключения сделок</th>
                    <th class="col_heading level0">Вид заявки</th>
                    <th class="col_heading level0">Цена за единицу базисного актива финансового инструмента</th>
                    <th class="col_heading level0">Количество единиц финансового инструмента в заявке</th>
                    <th class="col_heading level0">Признак сделки, которая должна быть заключена на основании данной заявки</th>
                    <th class="col_heading level0">Позиционный регистр стороны по договору поставки</th>
                    <th class="col_heading level0">Организация участник клиринга</th>
                    <th class="col_heading level0">Первая часть спреда.Идентификатор финансового инструмента для заключения сделок</th>
                    <th class="col_heading level0">Первая часть спреда.Направление заявки</th>
                    <th class="col_heading level0">Первая часть спреда.Цена за единицу базисного актива финансового инструмента</th>
                    <th class="col_heading level0">Первая часть спреда.Количество единиц финансового инструмента в заявке</th>
                    <th class="col_heading level0">Первая часть спреда.Признак сделки, которая должна быть заключена на основании данной заявки</th>
                    <th class="col_heading level0">Вторая часть спреда.Идентификатор финансового инструмента для заключения сделок</th>
                    <th class="col_heading level0">Вторая часть спреда.Направление заявки</th>
                    <th class="col_heading level0">Вторая часть спреда.Цена за единицу базисного актива финансового инструмента</th>
                    <th class="col_heading level0">Вторая часть спреда.Количество единиц финансового инструмента в заявке</th>
                    <th class="col_heading level0">Вторая часть спреда.Признак сделки, которая должна быть заключена на основании данной заявки</th>
                    <th class="col_heading level0">Торговый код инструмента</th>
                    <th class="col_heading level0">отправлено.seconds</th>
                    <th class="col_heading level0">отправлено.nanos</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th class="row_heading level0"></th>
                    <td class="data"><xsl:value-of select="description"/></td>
                    <td class="data"></td>
                    <td class="data"></td>
                    <td class="data"><xsl:value-of select="message/request_id"/></td>
                    <td class="data"><xsl:value-of select="message/connection_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/order_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/applying_at/seconds"/></td>
                    <td class="data"><xsl:value-of select="message/order/applying_at/nanos"/></td>
                    <td class="data"><xsl:value-of select="message/order/order_direction"/></td>
                    <td class="data"><xsl:value-of select="message/order/placed_order_by_trading_member_organization_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/placed_order_from_positional_register_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/fi_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/order_kind"/></td>
                    <td class="data"><xsl:value-of select="message/order/set_in_order_fi_for_trade_base_asset_price"/></td>
                    <td class="data"><xsl:value-of select="message/order/volume_in_lots"/></td>
                    <td class="data"><xsl:value-of select="message/order/trade_sign_code"/></td>
                    <td class="data"><xsl:value-of select="message/order/contract_delivery_party_with_positional_register_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/clearing_member_organization_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/first_part_spread/fi_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/first_part_spread/order_direction"/></td>
                    <td class="data"><xsl:value-of select="message/order/first_part_spread/set_in_order_fi_base_asset_price"/></td>
                    <td class="data"><xsl:value-of select="message/order/first_part_spread/volume_in_lots"/></td>
                    <td class="data"><xsl:value-of select="message/order/first_part_spread/trade_sign_code"/></td>
                    <td class="data"><xsl:value-of select="message/order/second_part_spread/fi_id"/></td>
                    <td class="data"><xsl:value-of select="message/order/second_part_spread/order_direction"/></td>
                    <td class="data"><xsl:value-of select="message/order/second_part_spread/set_in_order_fi_base_asset_price"/></td>
                    <td class="data"><xsl:value-of select="message/order/second_part_spread/volume_in_lots"/></td>
                    <td class="data"><xsl:value-of select="message/order/second_part_spread/trade_sign_code"/></td>
                    <td class="data"><xsl:value-of select="message/order/trade_code"/></td>
                    <td class="data"><xsl:value-of select="message/order/applying_at/seconds"/></td>
                    <td class="data"><xsl:value-of select="message/order/applying_at/nanos"/></td>
                </tr>
            </tbody>
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
    
<xsl:template match="//step[message_type='UploadStartData']" mode="Organization">
  <table>
    <caption>Организация</caption>
    <thead>
      <tr>
        <th>Идентификатор организации</th>
        <th>ИНН</th>
        <th>ТИН</th>
        <th>Код допуска к клирингу</th>
        <th>Участник клиринга</th>
        <th>Участник торгов</th>
        <th>Клиринговая организация</th>
        <th>Доверительное управление</th>
        <th>Ликвидационный неттинг</th>
        <th>Идентификатор шарда</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step/message/data/organization">
  <tr>
    <td><xsl:value-of select="organization_id"/></td>
    <td><xsl:value-of select="inn"/></td>
    <td><xsl:value-of select="tin"/></td>
    <td><xsl:value-of select="access_code"/></td>
    <td><xsl:value-of select="is_clearing_member"/></td>
    <td><xsl:value-of select="is_bidder"/></td>
    <td><xsl:value-of select="is_clearing_org"/></td>
    <td><xsl:value-of select="is_trust_management"/></td>
    <td><xsl:value-of select="is_liq_netting"/></td>
    <td><xsl:value-of select="bucket_id"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

<xsl:template match="//step[message_type='UploadStartData']" mode="Portfolio">
  <table>
    <caption>Портфель</caption>
    <thead>
      <tr>
      <th>Порфтель открыт для организации</th>
      <th>Организация участник клиринга</th>
      <th>Идентификатор портфеля</th>
      <th>Тип портфеля</th>
      <th>Портфель вышестоящего уровня</th>
      <th>Портфель открыт для участника клиринга</th>
      <th>Режим урегулирования</th>
      <th>Активный статус</th>
      <th>Идентификатор корневого портфеля</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step/message/data/portfolio">
  <tr>
<td><xsl:value-of select="portfolio_that_opened_for_organization_id"/></td>
<td><xsl:value-of select="clearing_member_organization_id"/></td>
<td><xsl:value-of select="portfolio_id"/></td>
<td><xsl:value-of select="portfolio_type"/></td>
<td><xsl:value-of select="high_level_portfolio_id"/></td>
<td><xsl:value-of select="opened_portfolio_for_trading_member_id"/></td>
<td><xsl:value-of select="is_settlement_regime"/></td>
<td><xsl:value-of select="is_active_status"/></td>
<td><xsl:value-of select="root_portfolio_id"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>


    
</xsl:stylesheet>
