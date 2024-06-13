<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>
    <xsl:key name="steps-by-composite-key" match="step" use="concat(message_type, '|', action, '|', message//request_id, '|', message/child::*[1]/name())"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>XML Transform</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
						margin-top: 30px;
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
                <h1><xsl:value-of select="//step[action[contains(text(),'start')]]/description"/></h1>
                <!-- Выводим стартовые данные, с помощью if проверяем что сущность существует, в противном случае не выводим пустую таблицу-->
                <h1>Стартовые данные</h1>
<xsl:if test="//step[message_type='UploadStartData']//organization">
<xsl:apply-templates select="//step[message_type='UploadStartData']" mode="organization"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//portfolio"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="portfolio"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//positional_register"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="positional_register"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//collateral_register"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="collateral_register"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//collateral_position"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="collateral_position"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//trades_position"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="trades_position"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//fi_asset"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="fi_asset"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//fi_for_trades"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="fi_for_trades"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//risk_vec_fi"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="risk_vec_fi"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//spread_group_struct"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="spread_group_struct"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//spread_group"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="spread_group"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//risk_param_spread_group"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="risk_param_spread_group"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//trade_sign"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="trade_sign"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//price_cor_fi"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="price_cor_fi"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//cur_ex_rate"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="cur_ex_rate"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//delivery_controller"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="delivery_controller"/></xsl:if>
<xsl:if test="//step[message_type='UploadStartData']//pers_risk_param"><xsl:apply-templates select="//step[message_type='UploadStartData']" mode="pers_risk_param"/></xsl:if>

                
				<h1>Список запросов сценария</h1>
				
  <table class="tcont countLines">
    <thead>
      <tr>
        <th>Тип сообщения</th>
        <th>Описание</th>
        <th>Название сервиса</th>

      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[action='send' and not(starts-with(message_type, 'Get'))]">
  <tr>
    <td><xsl:value-of select="message_type"/></td>
    <td><xsl:value-of select="description"/></td>
    <td><xsl:value-of select="service_name"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
<xsl:variable name="excludedMessageTypes" select="'CleanData UploadStartData SubscribeToResults BeginUploadStartData EndUploadStartData AllowRequestFromETS AllowRequestFromBO DisallowRequestFromETS DisallowRequestFromBO'"/>
<xsl:variable name="collateralRequestPassed"/>
<xsl:variable name="tradesRequestPassed"/>
                <h1>Ожидаемые результаты</h1>
                <br/>
                <xsl:for-each select="//step[generate-id() = generate-id(key('steps-by-composite-key', concat(message_type, '|', action, '|', message//request_id, '|', message/child::*[1]/name())))]">
                    <xsl:choose>
                        <xsl:when test="message_type='AllPortfoliosCalculate'">
                            <xsl:apply-templates select="." mode="AllPortfoliosCalculate"/>
                        </xsl:when>
                        <xsl:when test="message_type='OrderClearingCheck'">
                            <xsl:apply-templates select="." mode="OrderClearingCheck"/>
                        </xsl:when>
                        <xsl:when test="message_type='GetAllCollateralPositions'">
                            <h2><xsl:value-of select="message_type"/></h2>
                            <xsl:apply-templates select="." mode="GetAllCollateralPositions"/>
                        </xsl:when>
                        <xsl:when test="message_type='GetQueueData' and message/collateral_position_with_request_id">
                            <xsl:apply-templates select="." mode="GetQueueData_collateral"/>
                        </xsl:when>
						        <xsl:otherwise>
            <xsl:choose>
				<!-- убрать условие на сенд, после готовых трейдс и коллатерал позишн, никаких ресивов остаться не должно-->
                <xsl:when test="not(contains(concat(' ', $excludedMessageTypes, ' '), concat(' ', message_type, ' '))) and not(contains('start end', action))">
                    <h2><xsl:value-of select="description"/></h2>
					<h3>NOT IMPLEMENTED</h3>
                    <table border="1">
                        <thead>
                            <tr>
                                <xsl:for-each select="*">
                                    <th><xsl:value-of select="name()"/></th>
                                </xsl:for-each>
                            </tr>
                        </thead>
                        <tbody>
						<xsl:for-each select="key('steps-by-composite-key', concat(message_type, '|', action, '|', message//request_id, '|', message/child::*[1]/name()))">
                            <tr>
                                <xsl:for-each select="*">
                                    <td><xsl:value-of select="."/></td>
                                </xsl:for-each>
                            </tr>
							</xsl:for-each>
                        </tbody>
                    </table>
                </xsl:when>
            </xsl:choose>
        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                

                
            </body>
        </html>
    </xsl:template>
    
    <!-- Templates for requests -->
	
    <xsl:template match="step" mode="GetQueueData_collateral">
	<h2>Проверка позиции по обеспечению в очереди результатов</h2>
        <table>
            <caption>Запрос</caption>
            <thead>
                <tr>
		<th></th>
      <th>Тип сообщения</th>
	  <th>Описание</th>
      <th>Операция</th>
	  <th>Имя сервиса</th>
      <th>id запроса</th>
	  <th>Организация участник клиринга</th>
      <th>Идентификатор регистра обеспечения, в рамках которого открыта позиция по обеспечению</th>
      <th>Вид позиции по обеспечению</th>
      <th>Идентификатор актива</th>
      <th>единицы актива.входящая позиция</th>
      <th>единицы актива.зачислено</th>
      <th>единицы актива.списано</th>
      <th>единицы актива.отложенные обязательства</th>
      <th>единицы актива.средства под оплату товара</th>
      <th>единицы актива.текущая позиция</th>
      <th>единицы актива.маржинальное требование выставленное</th>
      <th>единицы актива.маржинальное требование текущее</th>
      <th>единицы актива.маржинальное требование неисполненное</th>
      
                </tr>
            </thead>
            <tbody>
			<xsl:for-each select="key('steps-by-composite-key', concat(message_type, '|', action, '|', message//request_id, '|', message/child::*[1]/name()))">
                <tr>
				<td><xsl:value-of select="execute"/></td>
                    <td><xsl:value-of select="message_type"/></td>
                    <td><xsl:value-of select="description"/></td>
                    <td><xsl:value-of select="action"/></td>
					<td><xsl:value-of select="service_name"/></td>
					<td><xsl:value-of select="message/collateral_position_with_request_id/request_id"/></td>
					
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/clearing_member_organization_id"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/collateral_position_opened_in_collateral_register_id"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/col_pos_type"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/asset_id"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/incoming_pos"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/credited"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/written_off"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/def_obligations"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/funds_for_goods"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/current_pos"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/margin_requir_placed"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/margin_requir_current"/></td>
<td><xsl:value-of select="message/collateral_position_with_request_id/collateral_position/reg_sec_in_units/margin_requir_unfull"/></td>

                </tr>
				</xsl:for-each>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="step" mode="AllPortfoliosCalculate">
	<h2>Рассчитать обеспеченность всех портфелей</h2>
        <table>
            <caption>Запрос</caption>
            <thead>
                <tr>
					<th>Тип сообщения</th>
                    <th>Описание</th>
                    <th>Операция</th>
                    <th>id запроса</th>
                    <th>id соединения</th>
                    <th>отправлено.seconds</th>
                    <th>отправлено.nanos</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><xsl:value-of select="message_type"/></td>
                    <td><xsl:value-of select="description"/></td>
                    <td><xsl:value-of select="action"/></td>
					<td><xsl:value-of select="message/request_id"/></td>
					<td><xsl:value-of select="message/connection_id"/></td>
					<td><xsl:value-of select="message/sent_to_clearing_at/seconds"/></td>
                    <td><xsl:value-of select="message/sent_to_clearing_at/nanos"/></td>

                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="step" mode="OrderClearingCheck">
	<h2>Проверка регистрации заявки</h2>
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
                    <th>Цена за единицу базисного актива финансового инструмента</th>
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
                    <th>Вторая часть спреда.Цена за единицу базисного актива финансового инструмента</th>
                    <th>Вторая часть спреда.Количество единиц финансового инструмента в заявке</th>
                    <th>Вторая часть спреда.Признак сделки, которая должна быть заключена на основании данной заявки</th>
                    <th>Торговый код инструмента</th>
                    <th>отправлено.seconds</th>
                    <th>отправлено.nanos</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><xsl:value-of select="description"/></td>
                    <td></td>
                    <td></td>
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
                    <td><xsl:value-of select="message/order/set_in_order_fi_for_trade_base_asset_price"/></td>
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
                    <td><xsl:value-of select="message/order/second_part_spread/set_in_order_fi_base_asset_price"/></td>
                    <td><xsl:value-of select="message/order/second_part_spread/volume_in_lots"/></td>
                    <td><xsl:value-of select="message/order/second_part_spread/trade_sign_code"/></td>
                    <td><xsl:value-of select="message/order/trade_code"/></td>
                    <td><xsl:value-of select="message/order/applying_at/seconds"/></td>
                    <td><xsl:value-of select="message/order/applying_at/nanos"/></td>
                </tr>
            </tbody>
        </table>
    </xsl:template>
    
    <!-- Template for GetAllCollateralPositions in mode GetAllCollateralPositions -->
    <xsl:template match="step" mode="GetAllCollateralPositions">
        <table>
		<thead>
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
			</thead>
			<tbody>
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
			</tbody>
        </table>
    </xsl:template>
    
<xsl:template match="//step[message_type='UploadStartData']" mode="organization">
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

<xsl:template match="//step[message_type='UploadStartData']" mode="portfolio">
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
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/portfolio">
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

<xsl:template match="//step[message_type='UploadStartData']" mode="positional_register">
  <table>
    <caption>Позиционный регистр</caption>
    <thead>
      <tr>
		<th>Организация участник клиринга</th>
		<th>Идентификатор портфеля, в рамках которого открыт позиционный регистр</th>
		<th>Идентификатор позиционного регистра</th>
		<th>Тип позиционного регистра</th>
		<th>Активный статус</th>
		<th>Идентификатор портфеля, для которого открыт позиционный регистр </th>
		<th>Идентификатор клиента участника торгов</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/positional_register">
  <tr>
	<td><xsl:value-of select="clearing_member_organization_id"/></td>
	<td><xsl:value-of select="positional_register_opened_in_portfolio_id"/></td>
	<td><xsl:value-of select="positional_register_id"/></td>
	<td><xsl:value-of select="pos_reg_type"/></td>
	<td><xsl:value-of select="is_active_status"/></td>
	<td><xsl:value-of select="positional_register_for_portfolio_id"/></td>
	<td><xsl:value-of select="trading_member_client_id"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>
    
	
	<xsl:template match="//step[message_type='UploadStartData']" mode="collateral_register">
  <table>
    <caption>Регистр обеспечения</caption>
    <thead>
      <tr>
      <th>Идентификатор портфеля, в рамках которого открыт регистр обеспечения</th>
      <th>Идентификатор регистра обеспечения</th>
      <th>Код сегмента клиринга</th>
      <th>Проверка достаточности обеспечения</th>
      <th>Модель маржирования</th>
      <th>Организация участник клиринга</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/collateral_register">
  <tr>
<td><xsl:value-of select="collateral_register_opened_in_portfolio_id"/></td>
<td><xsl:value-of select="collateral_register_id"/></td>
<td><xsl:value-of select="segment_code"/></td>
<td><xsl:value-of select="is_collateral_sufficiency_check"/></td>
<td><xsl:value-of select="margin_model"/></td>
<td><xsl:value-of select="clearing_member_organization_id"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>
	
		<xsl:template match="//step[message_type='UploadStartData']" mode="collateral_position">
  <table>
    <caption>Позиции по обеспечению</caption>
    <thead>
      <tr>
      <th>Идентификатор регистра обеспечения, в рамках которого открыта позиция по обеспечению</th>
      <th>Вид позиции по обеспечению</th>
      <th>Идентификатор актива</th>
      <th>Организация участник клиринга</th>
      <th>единицы актива.входящая позиция</th>
      <th>единицы актива.зачислено</th>
      <th>единицы актива.списано</th>
      <th>единицы актива.отложенные обязательства</th>
      <th>единицы актива.средства под оплату товара</th>
      <th>единицы актива.текущая позиция</th>
      <th>единицы актива.маржинальное требование выставленное</th>
      <th>единицы актива.маржинальное требование текущее</th>
      <th>единицы актива.маржинальное требование неисполненное</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/collateral_position">
  <tr>
<td><xsl:value-of select="collateral_position_opened_in_collateral_register_id"/></td>
<td><xsl:value-of select="col_pos_type"/></td>
<td><xsl:value-of select="asset_id"/></td>
<td><xsl:value-of select="clearing_member_organization_id"/></td>
<td><xsl:value-of select="reg_sec_in_units/incoming_pos"/></td>
<td><xsl:value-of select="reg_sec_in_units/credited"/></td>
<td><xsl:value-of select="reg_sec_in_units/written_off"/></td>
<td><xsl:value-of select="reg_sec_in_units/def_obligations"/></td>
<td><xsl:value-of select="reg_sec_in_units/funds_for_goods"/></td>
<td><xsl:value-of select="reg_sec_in_units/current_pos"/></td>
<td><xsl:value-of select="reg_sec_in_units/margin_requir_placed"/></td>
<td><xsl:value-of select="reg_sec_in_units/margin_requir_current"/></td>
<td><xsl:value-of select="reg_sec_in_units/margin_requir_unfull"/></td>

  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>
	
	
			<xsl:template match="//step[message_type='UploadStartData']" mode="trades_position">
  <table>
    <caption>Позиции по сделкам</caption>
    <thead>
      <tr>
      <th>Идентификатор позиционного регистра, в рамках которого открыта позиция по сделкам</th>
      <th>Идентификатор финансового инструмента, предназначенного для заключения сделок</th>
      <th>Организация участник клиринга</th>
      <th>единицы финансового инструмента.входящая позиция по сделкам покупки</th>
      <th>единицы финансового инструмента.входящая позиция по сделкам продажи</th>
      <th>единицы финансового инструмента.текущая позиция по сделкам покупки</th>
      <th>единицы финансового инструмента.текущая позиция по сделкам продажи</th>
      <th>единицы финансового инструмента.позиция по заявкам на покупку</th>
      <th>единицы финансового инструмента.позиция по заявкам на продажу</th>
      <th>единицы финансового инструмента.текущая нетто-позиция</th>
      <th>валюта сделки по фин инструменту.входящая позиция по сделкам покупки</th>
      <th>валюта сделки по фин инструменту.входящая позиция по сделкам продажи</th>
      <th>валюта сделки по фин инструменту.текущая позиция по сделкам покупки</th>
      <th>валюта сделки по фин инструменту.текущая позиция по сделкам продажи</th>
      <th>валюта сделки по фин инструменту.позиция по заявкам на покупку</th>
      <th>валюта сделки по фин инструменту.позиция по заявкам на продажу</th>
      <th>валюта сделки по фин инструменту.текущая нетто-позиция</th>
      <th>валюта сделки по фин инструменту.вариационная маржа по сделкам покупки</th>
      <th>валюта сделки по фин инструменту.вариационная маржа по сделкам продажи</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/trades_position">
  <tr>
<td><xsl:value-of select="trades_position_opened_in_positional_register_id"/></td>
<td><xsl:value-of select="trades_fi_id"/></td>
<td><xsl:value-of select="clearing_member_organization_id"/></td>
<td><xsl:value-of select="sections_in_units/incoming_position_on_purchase_trades"/></td>
<td><xsl:value-of select="sections_in_units/incoming_position_on_sale_trades"/></td>
<td><xsl:value-of select="sections_in_units/current_position_on_purchase_trades"/></td>
<td><xsl:value-of select="sections_in_units/current_position_on_sale_trades"/></td>
<td><xsl:value-of select="sections_in_units/purchase_orders_position"/></td>
<td><xsl:value-of select="sections_in_units/sale_orders_position"/></td>
<td><xsl:value-of select="sections_in_units/current_net_position"/></td>
<td><xsl:value-of select="sections_in_currency/incoming_position_on_purchase_trades"/></td>
<td><xsl:value-of select="sections_in_currency/incoming_position_on_sale_trades"/></td>
<td><xsl:value-of select="sections_in_currency/current_position_on_purchase_trades"/></td>
<td><xsl:value-of select="sections_in_currency/current_position_on_sale_trades"/></td>
<td><xsl:value-of select="sections_in_currency/purchase_orders_position"/></td>
<td><xsl:value-of select="sections_in_currency/sale_orders_position"/></td>
<td><xsl:value-of select="sections_in_currency/current_net_position"/></td>
<td><xsl:value-of select="sections_in_currency/purchase_trades_variation_margin"/></td>
<td><xsl:value-of select="sections_in_currency/sale_trades_variation_margin"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="fi_asset">
  <table>
    <caption>Финансовый инструмент – актив</caption>
    <thead>
      <tr>
      <th>Идентификатор актива</th>
      <th>Код актива</th>
      <th>Код вида актива</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/fi_asset">
  <tr>
<td><xsl:value-of select="asset_id"/></td>
<td><xsl:value-of select="asset_code"/></td>
<td><xsl:value-of select="type_asset_code"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="fi_for_trades">
  <table>
    <caption>Финансовый инструмент для заключения сделок</caption>
    <thead>
      <tr>
      <th>Идентификатор финансового инструмента для заключения сделок</th>
      <th>Торговый код финансового инструмента</th>
      <th>Код сегмента клиринга</th>
      <th>Идентификатор базисного актива</th>
      <th>Лот</th>
      <th>Код валюты сделок по финансовому инструменту</th>
      <th>Код типа финансового инструмента, предназначенного для заключения сделок</th>
      <th>Идентификатор финансового инструмента первой части спреда</th>
      <th>Идентификатор финансового инструмента второй части спреда</th>
      <th>Расчетная цена</th>
      <th>Точность</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/fi_for_trades">
  <tr>
<td><xsl:value-of select="fi_id"/></td>
<td><xsl:value-of select="fi_trading_code"/></td>
<td><xsl:value-of select="segment_code"/></td>
<td><xsl:value-of select="basic_asset_id"/></td>
<td><xsl:value-of select="item"/></td>
<td><xsl:value-of select="trade_curr_code"/></td>
<td><xsl:value-of select="fi_type"/></td>
<td><xsl:value-of select="first_part_spread_fi_id"/></td>
<td><xsl:value-of select="second_part_spread_fi_id"/></td>
<td><xsl:value-of select="estimated_price"/></td>
<td><xsl:value-of select="precision"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="risk_vec_fi">
  <table>
    <caption>Риск-вектор финансового инструмента</caption>
    <thead>
      <tr>
      <th>Идентификатор спредовой группы</th>
      <th>Код вида финансового инструмента</th>
      <th>Идентификатор финансового инструмента для заключения сделок</th>
      <th>Код вида риск-вектора</th>
      <th>Значения</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/risk_vec_fi">
  <tr>
<td><xsl:value-of select="spread_group_id"/></td>
<td><xsl:value-of select="fi_kind"/></td>
<td><xsl:value-of select="fi_id"/></td>
<td><xsl:value-of select="risk_vec_type_code"/></td>
<td><xsl:text>[</xsl:text>
<xsl:for-each select="fi_risk_vec_vals">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:for-each>
<xsl:text>]</xsl:text></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="spread_group_struct">
  <table>
    <caption>Структура спредовой группы</caption>
    <thead>
      <tr>
      <th>Идентификатор спредовой группы</th>
      <th>Код вида финансового инструмента</th>
      <th>Идентификатор финансового инструмента для заключения сделок</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/spread_group_struct">
  <tr>
<td><xsl:value-of select="spread_group_id"/></td>
<td><xsl:value-of select="fi_kind"/></td>
<td><xsl:value-of select="fi_id"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="spread_group">
  <table>
  <caption>Спредовая группа</caption>
    <thead>
      <tr>
      <th>Идентификатор спредовой группы</th>
      <th>Сегмент клиринга </th>
      <th>Код типа маржирвоания</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/spread_group">
  <tr>
<td><xsl:value-of select="spread_group_id"/></td>
<td><xsl:value-of select="clearing_segment"/></td>
<td><xsl:value-of select="marg_type_code"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="risk_param_spread_group">
  <table>
  <caption>Риск параметры спредовой группы</caption>
  <thead>
    <tr>
      <th>Идентификатор спредовой группы</th>
      <th>Код вида риск-вектора</th>
      <th>Метод определения наименьшего значения риск вектора</th>
      <th>Номер наименьшего значения</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/risk_param_spread_group">
  <tr>
<td><xsl:value-of select="spread_group_id"/></td>
<td><xsl:value-of select="risk_vec_type_code"/></td>
<td><xsl:value-of select="meth_det_min_code"/></td>
<td><xsl:value-of select="min_num"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="trade_sign">
  <table>
  <caption>Признак сделки</caption>
  <thead>
    <tr>
      <th>Признак сделки, которая должна быть заключена на основании данной заявки</th>
      <th>Признак, проверять заявку на обеспеченность</th>
      <th>Признак технической заявки</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/trade_sign">
  <tr>
<td><xsl:value-of select="trade_sign_code"/></td>
<td><xsl:value-of select="is_check_order_on_collateral"/></td>
<td><xsl:value-of select="is_tech_order"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="price_cor_fi">
  <table>
  <caption>Ценовой коридор</caption>
  <thead>
    <tr>
      <th>Идентификатор финансового инструмента для заключения сделок</th>
      <th>Верхняя граница ценового коридора</th>
      <th>Нижняя граница ценового коридора</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/price_cor_fi">
  <tr>
<td><xsl:value-of select="fi_id"/></td>
<td><xsl:value-of select="hi_board_price"/></td>
<td><xsl:value-of select="lo_board_price"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="cur_ex_rate">
  <table>
  <caption>Курс валюты</caption>
  <thead>
    <tr>
      <th>Код актива</th>
<th>Центральное значение</th>
<th>Точность</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/cur_ex_rate">
  <tr>
<td><xsl:value-of select="asset_code"/></td>
<td><xsl:value-of select="not_base_cur_mid_val"/></td>
<td><xsl:value-of select="precision "/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="delivery_controller">
  <table>
  <caption>Контролер поставки</caption>
  <thead>
    <tr>
      <th>id участника клиринга </th>
<th>id финансового инструмента </th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/delivery_controller">
  <tr>
  <td><xsl:value-of select="clearing_member_organization_id "/></td>
<td><xsl:value-of select="fi_id"/></td>

  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>

			<xsl:template match="//step[message_type='UploadStartData']" mode="pers_risk_param">
  <table>
  <caption>Индивидуальные риск-параметры</caption>
  <thead>
    <tr>
      <th>Идентификатор портфеля 2-го или 3-го уровня</th>
<th>Идентификатор спредовой группы</th>
<th>Код вида риск-вектора</th>
<th>Порядковый номер наименьшего значения</th>
<th>id организации – участника клиринга, для которого открыт портфель</th>
<th>идентификатор шарда</th>
      </tr>
    </thead>
    <tbody>
        <xsl:for-each select = "//step[message_type='UploadStartData']/message/data/pers_risk_param">
  <tr>
<td><xsl:value-of select="portfolio_id"/></td>
<td><xsl:value-of select="spread_group_id"/></td>
<td><xsl:value-of select="risk_vec_type_code"/></td>
<td><xsl:value-of select="pers_risk_param_num"/></td>
<td><xsl:value-of select="clearing_member_organization_id"/></td>
<td><xsl:value-of select="bucket_id"/></td>
  </tr>
            </xsl:for-each>
    </tbody>
  </table>
</xsl:template>





</xsl:stylesheet>
