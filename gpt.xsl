<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="//step[message_type='OrderClearingCheck']">
        <html>
            <head>
                <title>XML to HTML Table</title>
                <style>
                    table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; }
                </style>
            </head>
            <body>
                <table>
                    <caption>Запрос</caption>
                    <thead>
                        <tr>
                            <th>Описание</th>
                            <th>Тип сообщения</th>
                            <th>Операция</th>
                            <th>id запроса</th>
                            <th>id соединения</th>
                            <th>Идентификатор заявки</th>
                            <th>отправлено.seconds</th>
                            <th>отправлено.nanos</th>
                            <th>Направление заявки</th>
                            <th>Идентификатор организации – участника торгов, подавшего заявку</th>
                            <th>Идентификатор позиционного регистра, с указанием которого подана заявка</th>
                            <th>Идентификатор финансового инструмента для заключения сделок</th>
                            <th>Вид заявки</th>
                            <th>Количество единиц финансового инструмента в заявке</th>
                            <th>Признак сделки, которая должна быть заключена на основании данной заявки</th>
                            <th>Позиционный регистр стороны по договору поставки</th>
                            <th>Организация участник клиринга</th>
                            <th>Первая часть спреда.Идентификатор финансового инструмента для заключения сделок</th>
                            <th>Первая часть спреда.Направление заявки</th>
                            <th>Первая часть спреда.Цена за единицу базисного актива финансового инструмента</th>
                            <th>Первая часть спреда.Количество единиц финансового инструмента в заявке</th>
                            <th>Первая часть спреда.Признак сделки, которая должна быть заключена на основании данной заявки</th>
                            <th>Вторая часть спреда.Идентификатор финансового инструмента для заключения сделок</th>
                            <th>Вторая часть спреда.Направление заявки</th>
                            <th>Вторая часть спреда.Количество единиц финансового инструмента в заявке</th>
                            <th>Вторая часть спреда.Признак сделки, которая должна быть заключена на основании данной заявки</th>
                            <th>Торговый код инструмента</th>
                            <th>отправлено.seconds</th>
                            <th>отправлено.nanos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each-group select="//step[message_type='OrderClearingCheck']">
                            <tr>
                                <td><xsl:value-of select="description"/></td>
                                <td><xsl:value-of select="message_type"/></td>
                                <td><xsl:value-of select="action"/></td>
                                <td><xsl:value-of select="message/request_id"/></td>
                                <td><xsl:value-of select="message/connection_id"/></td>
                                <td><xsl:value-of select="message/order/order_id"/></td>
                                <td><xsl:value-of select="message/order/applying_at/seconds"/></td>
                                <td><xsl:value-of select="message/order/applying_at/nanos"/></td>
                                <td><xsl:value-of select="message/order/order_direction"/></td>
                                <td><xsl:value-of select="message/order/placed_order_by_trading_member_organization_id"/></td>
                                <td><xsl:value-of select="message/order/placed_order_from_positional_register_id"/></td>
                                <td><xsl:value-of select="message/order/fi_id"/></td>
                                <td><xsl:value-of select="message/order/order_kind"/></td>
                                <td><xsl:value-of select="message/order/volume_in_lots"/></td>
                                <td><xsl:value-of select="message/order/trade_sign_code"/></td>
                                <td><xsl:value-of select="message/order/contract_delivery_party_with_positional_register_id"/></td>
                                <td><xsl:value-of select="message/order/clearing_member_organization_id"/></td>
                                <td><xsl:value-of select="message/order/first_part_spread/fi_id"/></td>
                                <td><xsl:value-of select="message/order/first_part_spread/order_direction"/></td>
                                <td><xsl:value-of select="message/order/first_part_spread/set_in_order_fi_base_asset_price"/></td>
                                <td><xsl:value-of select="message/order/first_part_spread/volume_in_lots"/></td>
                                <td><xsl:value-of select="message/order/first_part_spread/trade_sign_code"/></td>
                                <td><xsl:value-of select="message/order/second_part_spread/fi_id"/></td>
                                <td><xsl:value-of select="message/order/second_part_spread/order_direction"/></td>
                                <td><xsl:value-of select="message/order/second_part_spread/volume_in_lots"/></td>
                                <td><xsl:value-of select="message/order/second_part_spread/trade_sign_code"/></td>
                                <td><xsl:value-of select="message/order/instrument_serial_id"/></td>
                                <td><xsl:value-of select="message/sent_to_clearing_at/seconds"/></td>
                                <td><xsl:value-of select="message/sent_to_clearing_at/nanos"/></td>
                            </tr>
                        </xsl:for-each-group>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
