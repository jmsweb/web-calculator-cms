<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="title" value="JMS - Web Based Calculator" />
	<tiles:putAttribute name="body">
		<div id="calculator-container">
			<table id="calculator-table">
				<tbody>
					<tr>
						<td colspan="4" class="screen">0</td>
					</tr>
					<tr>
						<td class="function custom-ac">AC</td>
						<td class="function">&#177;</td>
						<td class="function">&#37;</td>
						<td class="operand">&#247;</td>
					</tr>
					<tr>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td class="operand">&#215;</td>
					</tr>
					<tr>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td class="operand">&#45;</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td class="operand">&#43;</td>
					</tr>
					<tr>
						<td colspan="2" class="zero">0</td>
						<td>&#46;</td>
						<td class="operand">&#61;</td>
					</tr>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			var param1 = null;  	//Holding parameter
			var state = null;   	//State of the calculation
			var append = false; 	//To append numbers
			
			//This is called every click except PlusOrMinus, Decimal, or Percentage.
			function calculate() {
				switch(state) {
					case "addition":
						update(param1, $(".screen"), function(a, b) { return a + b; });
					break;
					
					case "division":
						update(param1, $(".screen"), function(a, b) { return a / b; });
					break;
					
					case "multiplication":
						update(param1, $(".screen"), function(a, b) { return a * b; });
					break;
					
					case "subtraction":
						update(param1, $(".screen"), function(a, b) { return a - b; });
					break;
				}
				append = false; //Calculation is performed and numbers cannot append to result.
				param1 = null;  //Reset the holding parameter to null.
				state = null;   //Calculation is performed and state need to be reset.
			}
			
			//Equivalent to document ready function
			$(function() {
				//jQuery register and process click event handler.
				$("#calculator-container td").not(".screen").click(function() {
					var object = $(this).html();  //Any button that is clicked in calculator.
					switch(object) {
						
						case "\xF7": 					//Divide
							calculate();				//Accumulate calculation, i.e., 2 / 2 / 2 / 2 / 2 and so on.
							state = "division";			//Equal need to know which operand to calculate result.
							param1 = update(param1, $(".screen"), function(a, b) { return a / b; });  //Assign result to holding parameter
						break;
							
						case "\xD7": 					//Multiple
							calculate();				//Accumulate calculation, i.e., 2 * 2 * 2 * 2 * 2 and so on.
							state = "multiplication";	//Equal need to know which operand to calculate result.
							param1 = update(param1, $(".screen"), function(a, b) { return a * b; });
						break;
							
						case "\x2D": 					//Subtract
							calculate();				//Accumulate calculation, i.e., 2 - 2 - 2 - 2 - 2 and so on.
							state = "subtraction";		//Equal need to know which operand to calculate result.
							param1 = update(param1, $(".screen"), function(a, b) { return a - b; });
						break;
							
						case "\x2B": 					//Add
							calculate();				//Accumulate calculation, i.e., 2 + 2 + 2 + 2 + 2 and so on.
							state = "addition";			//Equal need to know which operand to calculate result.
							param1 = update(param1, $(".screen"), function(a, b) { return a + b; });
						break;
							
						case "\x3D": 					//Equal
							calculate();				//The equal button is clicked, calculate the result!
						break;
						
						case "AC": 						//All Clear
							append = false; 			//Calculation is performed and numbers cannot append to result.
							param1 = null;  			//Reset the holding parameter to null.
							state = null;   			//Calculation is performed and state need to be reset.
							$(".screen").html(0);		//Display '0' on screen indicating All Clear was requested. 
						break;
						
						case "\xB1": 					//Toggle Positive or Negative
							$(".screen").html(Number($(".screen").html()) * -1);
						break;
						
						case "\x25": 					//Toggle Percent
							$(".screen").html(Number($(".screen").html()) / 100);
						break;
						
						case "\x2E": 					//Add Decimal
							if($(".screen").html().indexOf("\x2E") < 0) {	//Math cannot have more than two decimals
								$(".screen").append("\x2E");				//Append the decimal
								param1 = $(".screen").html();				//Assign holding parameter with decimal
								append = true;								//Allow appending digits
							}
						break;
						
						default: 									//0 through 9
							if(null == param1) { 					//Check whether holding parameter has nothing in memory  
								$(".screen").html($(this).html());  //Do not append
								param1 = $(this).html();			//Initialize holding parameter
								append = true;						//Allow appending
							} else {
								if(append) { 									//Allow appending digit
									if($(".screen").html().length < 10) {    	//Disallow appending after 9 digits
										$(".screen").append($(this).html());	//Please append digit to screen
									}
								} else {										//Appending is disallowed
									$(".screen").html($(this).html());			//Start new digit on screen
									append = true;								//Allow appending
								}
							}
					}
				});
			});
			
			//A blueprint to update screen, holding parameter, and process callback formula
			function update(num, element, formula) {
				if(null == num) {												//Check null of holding parameter
					num = Number($(element).html());							//Extract screen digit and assign to num
				} else {														
					num = formula(Number(num), Number($(element).html()));		//Process callback formula
					$(element).html(num);										//Output result on screen
				}
				return num;														//Return the result
			}
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>