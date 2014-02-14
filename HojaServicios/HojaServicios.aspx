<%@ Page Title="Hoja de Servicios" Language="C#" AutoEventWireup="true" CodeBehind="HojaServicios.aspx.cs" Inherits="HojaServicios.HojaServicios" MasterPageFile="~/Site.Master"%>



<asp:Content ID="cntEncabezado" runat="server" ContentPlaceHolderID="cphEncabezado">
    <table id="tblEncabezado" style="font-weight:bold; font-size:small; border:solid;">
        <tr>
            <td class="tblBordes"><p>P&aacute;gina 1 de 1</p></td>
            <td class="tblBordes" rowspan="2"><p style="text-align:center;">PROCEDIMIENTOS: RELALIZAR ACTIVIDADES PARA PLANEAR Y DESARROLLAR LA PRESTACI&Oacute;N DEL SERVICIO DE POLIC&Iacute;A</p></td>
            <td class="tblBordes" rowspan="4" style="text-align:center;"><img id="logoPonal" src="/Images/escudoPonal.png" /><br/><p style="text-align:center; ">POLIC&Iacute;A NACIONAL</p></td>
        </tr>
        <tr>
            <td class="tblBordes"><p>C&oacute;digo: 1CS-FR-004</p></td>
        </tr>
        <tr>
            <td class="tblBordes"><p>Fecha: 23/10/2013</p></td>
            <td class="tblBordes" rowspan="2"><p style="text-align:center;">HOJA DE SERVICIOS</p></td>
        </tr>
        <tr>
            <td class="tblBordes"><p>Versi&oacute;n: 0</p></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="cntLblEstacion" runat="server" ContentPlaceHolderID="cphLblEstacion">
    <strong><p style="text-align:center;"><asp:Label ID="lblEstacion" runat="server"></asp:Label></p></strong>
</asp:Content>


<asp:Content ID="cntTblCuadrante" runat="server" ContentPlaceHolderID="cphTblCuadrante">
    <br />
    <asp:HiddenField ID="hfCuadrante" runat="server" ClientIDMode="Static" />
    <table id="tblCuadrante" class="tblBordes">
        <tr>
            <td class="tblBordes"><strong>C&Oacute;DIGO CUADRANTE</strong></td>
            <td class="tblBordes"><asp:DropDownList ID="ddlCuadrantes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCuadrantes_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td class="tblBordes"><strong>FECHA DE ELABORACI&Oacute;N</strong></td>
            <td class="tblBordes"><p style="margin:0px;"><asp:Label ID="lblFechaActual" runat="server"></asp:Label></p></td>
        </tr>
        <tr>
            <td class="tblBordes"><strong>PARA LA SEMANA</strong></td>
            <td class="tblBordes">
                <asp:DropDownList ID="ddlSemana" runat="server" Enabled="true" AutoPostBack="true" OnSelectedIndexChanged="ddlSemana_SelectedIndexChanged"></asp:DropDownList>
                
                <asp:DropDownList ID="ddlYear" runat="server" Enabled="true" AutoPostBack="true" OnSelectedIndexChanged="ddlSemana_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="cntLblSemanas" runat="server" ContentPlaceHolderID="cphLblSemanas">
    <p style="text-align:center; margin:5px; font-style:italic;">
        <asp:Label ID="lblSemanas" runat="server"></asp:Label>
    </p>
</asp:Content>
<asp:Content ID="cntTblDelitos" runat="server" ContentPlaceHolderID="cphTblDelitos">
    <asp:HiddenField ID="hfSemanas" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hfDelitos" runat="server" ClientIDMode="Static" />
    <table style="border:solid;" id="tblDelitos">
        <tr>
            <td class="tdTitTablas">
                <p style="text-align:center;">
                    <asp:Label ID="lblDelitos" runat="server" Text="DELITOS" Width="70px" Font-Bold="True"></asp:Label>
                </p>
            </td>
            <td class="tdHeadTblEst" style="width:40px;" colspan="4">
                <asp:DataList runat="server" ID="dlSemanasDelitos" BorderColor="Black" BorderWidth="1px" GridLines="Both" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="dlSemanasDelitos_SelectedIndexChanged" Height="30px">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" ForeColor="White" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSemanasDelitos" Text='<%# "SEM "+ Eval("NUM_SEM") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td class="tdHeadTblEst"><p class="pTitTblEst" >Total cuadrante</p></td>
            <td class="tdHeadTblEst"><p class="pTitTblEst" >Total estaci&oacute;n</p></td>
            <td class="tdHeadTblEst"><p class="pTitTblEst" >Aporte estaci&oacute;n</p></td>
        </tr>
        <tr>
            <td class="tblBordes"><asp:DropDownList ID="ddlDelitos1" runat="server" ClientIDMode="Static" AutoPostBack="True" ForeColor="Blue" OnSelectedIndexChanged="ddlDelito1Changed"></asp:DropDownList></td>
            <td class="tdTblEst" colspan="4">
                <asp:DataList ID="dlDelitos1" runat="server" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="1px" GridLines="Both" Height="26px" CellPadding="0" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="Blue" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False" Width="100%">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="126px" />
                    <ItemTemplate>
                        <asp:Label ID="lblValDel1" runat="server" Text='<%# Eval("DELITO") %>'></asp:Label>
                    </ItemTemplate>
                    <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:DataList></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboSumaDelitos1Cuadrante" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboSumaDelitos1Estacion" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboDelitos1Aporte" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
        </tr>
        <tr>
            <td class="tblBordes"><asp:DropDownList ID="ddlDelitos2" runat="server" ClientIDMode="Static" AutoPostBack="True" ForeColor="Brown" OnSelectedIndexChanged="ddlDelito2Changed"></asp:DropDownList></td>
            <td class="tdTblEst" colspan="4">
                <asp:DataList ID="dlDelitos2" runat="server" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="1px" Height="26px" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="Brown" GridLines="Both" HorizontalAlign="Center" CellSpacing="-1" Width="100%">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="126px" />
                    <ItemTemplate>
                        <asp:Label ID="lblValDel2" runat="server" Text='<%# Eval("DELITO2") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboSumaDelitos2Cuadrante" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboDelitos2Estacion" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboDelitos2Aporte" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
        </tr>
        <tr>
            <td class="tblBordes"><asp:DropDownList ID="ddlDelitos3" runat="server" ClientIDMode="Static" AutoPostBack="True" ForeColor="Green" OnSelectedIndexChanged="ddlDelito3Changed"></asp:DropDownList></td>
            <td class="tdTblEst" colspan="4">
                <asp:DataList ID="dlDelitos3" runat="server" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="1px" GridLines="Vertical" Height="26px" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="Green" HorizontalAlign="Center" CellPadding="0" ShowFooter="False" ShowHeader="False" Width="100%">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Arial" Font-Size="Small" Width="126px" />
                    <ItemTemplate>
                        <asp:Label ID="lblValDel3" runat="server" Text='<%# Eval("DELITO3") %>'></asp:Label>
                    </ItemTemplate>
                    <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                </asp:DataList></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboSumaDelitos3Cuadrante" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboDelitos3Estacion" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p class="pEstDelitos"><asp:TextBox ID="tboDelitos3Aporte" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
        </tr>
    </table>
    
    </asp:Content>
<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="Scripts/graphics.js"></script>
    <script type="text/javascript" src="Scripts/queryCuadrante.js"></script>
</asp:Content>
<asp:Content ID="cntGraficoEstadistico" runat="server" ContentPlaceHolderID="cphGraficoEstadisticas">
    <div id="divLeyenda" style="width: 200px; height: 350px;"></div>
    <div id="chartOne" style="width: 500px; height: 350px;"></div>
</asp:Content>
<asp:Content ID="cntOtrasProblematicas" runat="server" ContentPlaceHolderID="cphTblOtrasProblematicas">
    <br />
        <asp:HiddenField ID="hfContravenciones" runat="server" />
        <table style="border:solid;" id="tblContravenciones">
        <tr>
            <td class="tdTitTablas" style="margin-right:0px; width:80px;">
                <p style="text-align:center; margin-right:0px; font-weight:bold;">CONTRAVENCIONES/OTRAS PROBLEMÁTICAS</p></td>
            <td class="tdHeadTblEst" style="width:40px;" colspan="4">
                <asp:DataList runat="server" ID="dlSemanasContravenciones" BorderColor="Black" BorderWidth="1px" GridLines="Both" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" Height="36px">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" ForeColor="White" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lboSemanasContravenciones" Text='<%# "SEM " + Eval("NUM_SEM") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td class="tdHeadTblEst"><p class="pTitTblEst" >Total cuadrante</p></td>
            <td class="tdHeadTblEst"><p class="pTitTblEst" >Total estaci&oacute;n</p></td>
            <td class="tdHeadTblEst"><p class="pTitTblEst" >Aporte estaci&oacute;n</p></td>
        </tr>
        <tr>
            <td class="tblBordes" style="width:80px;"><asp:DropDownList ID="ddlContravenciones1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddContrevencion1Changed"></asp:DropDownList></td>
            <td class="tdTblEst" colspan="4">
                <asp:DataList ID="dlContravenciones1" runat="server" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" GridLines="Both" HorizontalAlign="Center" Height="27px" CellSpacing="-1" Width="100%">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="106px" />
                    <ItemTemplate>
                        <asp:Label ID="lblValContra1" runat="server" Text='<%# Eval("DELITO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList></td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboSumaContra1Cuadrante" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboContra1Estacion" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboContra1Aporte" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
        </tr>
        <tr>
            <td class="tblBordes" style=" width:80px;"><asp:DropDownList ID="ddlContravenciones2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddContrevencion2Changed"></asp:DropDownList></td>
            <td class="tdTblEst" colspan="4">
                <asp:DataList ID="dlContravenciones2" runat="server" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" GridLines="Both" HorizontalAlign="Center" Height="27px" CellSpacing="-1" Width="100%">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="106px" />
                    <ItemTemplate>
                        <asp:Label ID="lblValContra2" runat="server" Text='<%# Eval("DELITO2") %>'>></asp:Label>
                    </ItemTemplate>
                </asp:DataList></td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboSumaContra2Cuadrante" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboContra2Estacion" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tbocontra2Aporte" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
        </tr>
        <tr>
            <td class="tblBordes" style=" width:80px;"><asp:DropDownList ID="ddlContravenciones3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddContrevencion3Changed"></asp:DropDownList></td>
            <td class="tdTblEst" colspan="4">
                <asp:DataList ID="dlContravenciones3" runat="server" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" GridLines="Both" HorizontalAlign="Center" Height="28px" CellSpacing="-1" Width="100%">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="106px" />
                    <ItemTemplate>
                        <asp:Label ID="lblValContra3" runat="server" Text='<%# Eval("DELITO3") %>'>></asp:Label>
                    </ItemTemplate>
                </asp:DataList></td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboSumaContra3Cuadrante" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboContra3Estacion" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
            <td class="tdTblEst">
                <p class="pEstDelitos"><asp:TextBox ID="tboContra3Aporte" runat="server" Width="32px" Enabled="false" style="text-align:center"></asp:TextBox></p>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="cntTblResultadosOperativos" runat="server" ContentPlaceHolderID="cphTblResultadosOperativos">
    <br />
    <table style="border:solid;" id="tblResultadosOperativos">
        <tr>
            <td class="tdTitTablas" style="margin-right:0px; width:412px;">
                <p style="text-align:center; margin-right:0px; font-weight:bold; font-size:x-small;">Resultados operativos (capturas, incautaciones y recuperaciones)</p></td>
            <td class="tdHeadTblEst" style="width:40px;" colspan="4">
                <p>
                    <asp:DataList runat="server" ID="dlSemanasResultados" BorderColor="Black" BorderWidth="1px" GridLines="Both" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" Height="28px">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" ForeColor="White" HorizontalAlign="Center" />
                        <ItemTemplate>
                                <asp:Label runat="server" ID="lblDlSemanas" Text='<%# "SEM "+Eval("NUM_SEM") %>'></asp:Label>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SeparatorStyle BorderColor="Black" BorderStyle="Solid" />
                    </asp:DataList>
                </p>
            </td>
        </tr>
        <tr>
            <td class="tdTblEst"><p style="text-align:center;"><asp:Label runat="server" ID="lblCapturas" Text="CAPTURAS"></asp:Label></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboCapturasSem1" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboCapturasSem2" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboCapturasSem3" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboCapturasSem4" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
        </tr>
        <tr>
            <td class="tdTblEst"><p style="text-align:center;"><asp:Label runat="server" ID="lblIncautaciones" Text="INCAUTACIONES"></asp:Label></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboIncautacionesSem1" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboIncautacionesSem2" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboIncautacionesSem3" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboIncautacionesSem4" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
        </tr>
        <tr>
            <td class="tdTblEst"><p style="text-align:center;"><asp:Label runat="server" ID="lblRecuperaciones" Text="RECUPERACIONES"></asp:Label></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboRecuperacionesSem1" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboRecuperacionesSem2" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboRecuperacionesSem3" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
            <td class="tdTblEst"><p style="text-align:center;"><asp:TextBox runat="server" ID="tboRecuperacionesSem4" Enabled="false" style="text-align:center"></asp:TextBox></p></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ID="cntLblestaditicoDelincuencial" ContentPlaceHolderID="cphLblEstadisticoDelincuencial">
    <br />
    <p style="text-align:center; font-style:italic;">
        <asp:Label ID="lblEstadisticoDelincuencial" runat="server"></asp:Label>
    </p>
</asp:Content>
<asp:Content runat="server" ID="cntTblEstadisticoDelincuencial" ContentPlaceHolderID="cphTblEstadisticoDelincuencial">
    <br />
	  <table style="border:solid;">
         <tr>
            <td class="tdTitTablas"><p style="text-align:center; margin-right:0px; font-weight:bold; font-size:x-small;">Horas Delito</p></td>
            <td colspan="3"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">DOMINGO</p></td>
            <td colspan="3"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">LUNES</p></td>
            <td colspan="3"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">MARTES</p></td>
            <td colspan="3"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">MI&Eacute;RCOLES</p></td>
            <td colspan="3"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">JUEVES</p></td>
            <td colspan="3"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">VIERNES</p></td>
            <td colspan="3"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">S&Aacute;BADO</p></td>
            <td colspan="2"class="tdHeadTblEst" style="width:100px;"><p style="color:white; font-size:x-small;">TOTAL HORA</p></td>
        </tr>
        <tr>
            <td rowspan="3" class="tdHeadTblEst"><p class="pHorasEstaAnalisis">00:00 - 04:00</p></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1DomingoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1LunesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1MartesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1MiercoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1JuevesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1ViernesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1SabadoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora1Delito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora1TotalDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora1DomingoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1LunesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1MartesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1MiercoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1JuevesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1ViernesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1SabadoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora1Delito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora1TotalDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora1DomingoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1LunesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1MartesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1MiercoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1JuevesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1ViernesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora1SabadoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora1SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora1SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora1Delito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora1TotalDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td rowspan="3" class="tdHeadTblEst"><p class="pHorasEstaAnalisis">04:00 - 08:00</p></td>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora2DomingoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2LunesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2MartesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2MiercoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2JuevesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2ViernesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2SabadoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora2Delito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora2TotalDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora2DomingoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2LunesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2MartesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2MiercoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2JuevesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2ViernesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2SabadoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora2Delito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora2TotalDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora2DomingoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2LunesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2MartesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2MiercoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2JuevesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2ViernesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora2SabadoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora2SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora2SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora2Delito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora2TotalDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td rowspan="3" class="tdHeadTblEst"><p class="pHorasEstaAnalisis">08:00 - 12:00</p></td>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora3DomingoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3LunesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3MartesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3MiercoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3JuevesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3ViernesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3SabadoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora3Delito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora3TotalDelito1" Width="50px" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora3DomingoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3LunesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3MartesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3MiercoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3JuevesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3ViernesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3SabadoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora3Delito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora3TotalDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora3DomingoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3LunesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3MartesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3MiercoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3JuevesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3ViernesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora3SabadoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora3SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora3SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora3Delito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora3TotalDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td rowspan="3" class="tdHeadTblEst"><p class="pHorasEstaAnalisis">12:00 - 16:00</p></td>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora4DomingoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4LunesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4MartesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4MiercoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4JuevesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4ViernesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4SabadoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora4Delito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora4TotalDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora4DomingoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4LunesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4MartesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4MiercoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4JuevesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4ViernesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4SabadoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora4Delito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora4TotalDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora4DomingoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4LunesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4LunesDelito3" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4MartesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4MartesDelito3" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4MiercoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4MiercoDelito3" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4JuevesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4JuevesDelito3" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4ViernesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4ViernesDelito3" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora4SabadoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora4SabadoDelito3" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora4SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora4Delito3" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora4TotalDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td rowspan="3" class="tdHeadTblEst"><p class="pHorasEstaAnalisis">16:00 - 20:00</p></td>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora5DomingoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5LunesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5MartesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5MiercoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5JuevesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5ViernesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5SabadoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora5Delito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora5TotalDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora5DomingoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5LunesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5MartesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5MiercoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5JuevesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5ViernesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5SabadoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora5Delito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora5TotalDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkHora5DomingoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5LunesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5MartesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5MiercoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5JuevesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5ViernesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkHora5SabadoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboHora5SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadHora5SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHora5Delito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHora5TotalDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td rowspan="3" class="tdHeadTblEst"><p class="pHorasEstaAnalisis">20:00 - 24:00</p></td>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora6DomingoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6DomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6LunesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6LunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6MartesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6MartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6MiercoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6MiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6JuevesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6JuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6ViernesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6ViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6SabadoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6SabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora6Delito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora6TotalDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora6DomingoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6DomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6LunesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6LunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6MartesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6MartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6MiercoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6MiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6JuevesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6JuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6ViernesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6ViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6SabadoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6SabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora6Delito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora6TotalDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEst" ><asp:TextBox runat="server" ID="tboChkHora6DomingoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6DomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6LunesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6LunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6MartesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6MartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6MiercoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6MiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6JuevesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6JuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6ViernesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6ViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboChkHora6SabadoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboHora6SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantidadHora6SabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEst"><asp:TextBox runat="server" ID="tboNomTotalHora6Delito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEst"><asp:TextBox runat="server" ID="tboCantTotalHora6TotalDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
		</tr>
        <tr>
            <td rowspan="3" class="tdHeadTblEst"><p class="pHorasEstaAnalisis">TOTAL D&Iacute;A</p></td>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkTotalDomingoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalDomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalDomingoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalLunesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalLunesDelito1" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalLunesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalMartesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalMartesDelito1" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalMartesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalMiercoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalMiercoDelito1" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalMiercoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalJuevesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalJuevesDelito1" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalJuevesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalViernesDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalViernesDelito1" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalViernesDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalSabadoDelito1" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalSabadoDelito1" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalSabadoDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHoraTotalSemDelito1" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHoraTotalSemDelito1" Width="50px" ForeColor="Blue" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkTotalDomingoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalDomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalDomingoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalLunesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalLunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalLunesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalMartesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalMartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalMartesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalMiercoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalMiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalMiercoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalJuevesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalJuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalJuevesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalViernesDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalViernesDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalSabadoDelito2" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalSabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalSabadoDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHoraTotalSemDelito2" ForeColor="Red" Width="50px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHoraTotalSemDelito2" Width="50px" ForeColor="Red" Enabled="false"></asp:TextBox></td>
		</tr>
		<tr>
            <td class="tdTblEstImp" ><asp:TextBox runat="server" ID="tboChkTotalDomingoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalDomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalDomingoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalLunesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalLunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalLunesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalMartesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalMartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalMartesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalMiercoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalMiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalMiercoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalJuevesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalJuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalJuevesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalViernesDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalViernesDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboChkTotalSabadoDelito3" Width="30px" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboTotalSabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantidadTotalSabadoDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
			<td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboNomTotalHoraTotalSemDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
            <td class="tdTblEstImp"><asp:TextBox runat="server" ID="tboCantTotalHoraTotalSemDelito3" Width="50px" ForeColor="Green" Enabled="false"></asp:TextBox></td>
		</tr>
	  </table>
</asp:Content>
<asp:Content ID="cntLblGeorreferenciacion" runat="server" ContentPlaceHolderID="cphLblGeorreferenciacion">
    <br />
    <p style="text-align:center; font-style:italic;">
        <asp:Label ID="lblGeorreferenciacion" runat="server"></asp:Label>
    </p>
</asp:Content>
<asp:Content ID="cntImgGeorreferenciacion" runat="server" ContentPlaceHolderID="cphImgGeorreferenciacionDelitos">
    <br />
    <div id="divImg">
        <%--<input type="text" id="stateName" value="MEBOGPNVCCC03E10000071"/><!--MEBOGPNVCCC03E10000071 -->
        <input type="button" id="execute" value="Get Details" />
        <br />
        <br />
        <div id="info" style="padding:5px; margin:5px; background-color:#eee;">
        </div>--%>
        <div id="divMap"></div>
    </div>
</asp:Content>