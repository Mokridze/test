<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
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
                <table id="T_f57e0">
                    <caption>Запрос</caption>
                    <thead>
                        <tr>
                            <th class="blank level0">&nbsp;</th>
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
                            <th class="col_heading level0">Вторая часть спреда.Количество единиц финансового инструмента в заявке</th>
                            <th class="col_heading level0">Вторая часть спреда.Признак сделки, которая должна быть заключена на основании данной заявки</th>
                            <th class="col_heading level0">Торговый код инструмента</th>
                            <th class="col_heading level0">отправлено.seconds</th>
                            <th class="col_heading level0">отправлено.nanos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="//step">
                            <tr>
                                <th class="row_heading level0">0</th>
                                <td class="data"><xsl:value-of select="description"/></td>
                                <td class="data"><xsl:value-of select="message_type"/></td>
                                <td class="data"><xsl:value-of select="action"/></td>
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
                                <td class="data"><xsl:value-of select="message/order/second_part_spread/volume_in_lots"/></td>
                                <td class="data"><xsl:value-of select="message/order/second_part_spread/trade_sign_code"/></td>
                                <td class="data"><xsl:value-of select="message/order/instrument_serial_id"/></td>
                                <td class="data"><xsl:value-of select="message/sent_to_clearing_at/seconds"/></td>
                                <td class="data"><xsl:value-of select="message/sent_to_clearing_at/nanos"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
