using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using Microsoft.VisualBasic;




namespace HojaServicios
{
    public partial class HojaServicios : System.Web.UI.Page
    {
        DateTime dtCurrentTime;
    
        DataTable dtWeeks;
        DataTable dtWeeksYear;

        DataRow drWeeks;
        DataRow drWeeksYear;

        DataTable dtDatosPrueba;//BORRAR CON DELITOS DE LA DIJIN
        DataRow drDatosPrueba;//BORRAR CON DELITOS DE LA DIJIN
        DataTable dtCuadrantesPrueba; //BORRAR CON TABLA DE CUADRANTES SIVICC2
        DataRow drCuadrantesPrueba; //BORRAR CON TABLA DE CUADRANTES SIVICC2

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//Control de cargue de pagina
            {

                string sNomDpto = Request["nomDpto"] != null ? Request["nomDpto"] : "SIN DPTO";
                string sNomEstacion = Request["nomEstacion"] != null ? Request["nomEstacion"] : "SIN ESTACION";

                lblEstacion.Text = "ESTACIÓN DE POLICÍA "+sNomEstacion;

                //*****-----------Borrar cunado se tenga la tabla de los delitos de SIVICC2-----------*******
                dtCuadrantesPrueba = new DataTable();
                dtCuadrantesPrueba.Columns.Add("ID_CUADRANTE", typeof(int));
                dtCuadrantesPrueba.Columns.Add("NRO_CUADRANTE", typeof(string));

                for (int i = 0; i < 21; i++)
                {
                    drCuadrantesPrueba = dtCuadrantesPrueba.NewRow();
                    drCuadrantesPrueba[0] = i + 1;
                    if (i < 10)
                    {
                        drCuadrantesPrueba[1] = "MECALPNVCCD04E1500000" + Convert.ToString(i + 1);
                    }
                    else {
                        drCuadrantesPrueba[1] = "MECALPNVCCD04E150000" + Convert.ToString(i);
                    }
                    
                    dtCuadrantesPrueba.Rows.Add(drCuadrantesPrueba);
                }

                ddlCuadrantes.DataSource = dtCuadrantesPrueba;
                ddlCuadrantes.DataTextField = dtCuadrantesPrueba.Columns[1].ToString();
                ddlCuadrantes.DataBind();

                hfCuadrante.Value = ddlCuadrantes.SelectedValue;
                //---------***Borrar hasta qui***----------


                // Show Currente Date
                dtCurrentTime = System.DateTime.Today;
                string sCurrentDate;
                sCurrentDate = "&nbsp" + dtCurrentTime.ToString("d 'de' MMMM 'de' yyyy", CultureInfo.CreateSpecificCulture("es-COL"));
                lblFechaActual.Text = sCurrentDate;
                lblFechaActual.Font.Size = 10;

                // show the number week within the dropdownlist
                dtWeeksYear = new DataTable();
                dtWeeksYear.Columns.Add("NUM_SEM",typeof(Int32));

                for (int i = 52; i > 0; i--)
                {
                    drWeeksYear = dtWeeksYear.NewRow();
                    drWeeksYear[0] = i;
                    dtWeeksYear.Rows.Add(drWeeksYear);
                }

                ddlSemana.DataSource = dtWeeksYear;
                ddlSemana.DataTextField = "NUM_SEM";
                ddlSemana.DataValueField = "NUM_SEM";
                ddlSemana.DataBind();


                ddlYear.DataSource = new Base_Datos.dsSivicc2TableAdapters.V_WEEKS_ANIO_DIJINTableAdapter().GetYear();
                ddlYear.DataTextField = "ANIO";
                ddlYear.DataValueField = "ANIO";
                ddlYear.DataBind();


                // get weeks from weeks of year table
                dtWeeks = new DataTable();
                int iNumWeek = Convert.ToInt16(ddlSemana.SelectedValue);
                int iYear = Convert.ToInt16(ddlYear.SelectedValue);
                String sWeeks = "";
                new Base_Datos.dsSivicc2TableAdapters.QueriesTableAdapter().LAST_4_WEEKS_YEAR(new Decimal(iNumWeek), new Decimal(iYear), out sWeeks);
                String[] sAWeeks = sWeeks.Split(',');                                                   

                dtWeeks.Columns.Add("NUM_SEM", typeof(String));


                for (int i = 1; i < sAWeeks.Length; i++)
                {
                    drWeeks = dtWeeks.NewRow();
                    drWeeks[0] = sAWeeks[i];
                    dtWeeks.Rows.Add(drWeeks);
                    i += 2;
                }

                //set dropdownlis of weeks
                dlSemanasDelitos.DataSource = dtWeeks;
                dlSemanasDelitos.DataBind();
                dlSemanasContravenciones.DataSource = dlSemanasDelitos.DataSource;
                dlSemanasContravenciones.DataBind();
                dlSemanasResultados.DataSource = dlSemanasDelitos.DataSource;
                dlSemanasResultados.DataBind();

                //set hiddenField from weeks info
                hfSemanas.Value = SetHiddenFieldWeeks();

                lblEstadisticoDelincuencial.Text = "Análisis estadístico delincuencial por días entre " + sAWeeks[sAWeeks.Length - 12] + " y " + sAWeeks[sAWeeks.Length - 3]+
                    " comprendidas entre "+sAWeeks[sAWeeks.Length - 11] +" y "+ sAWeeks[sAWeeks.Length - 1];

                lblGeorreferenciacion.Text= "Georreferenciación de la actividad delictiva y ubicación de puntos críticos entre las semanas " + sAWeeks[sAWeeks.Length - 12] + " y " + sAWeeks[sAWeeks.Length - 3] +
                    " comprendidas entre " + sAWeeks[sAWeeks.Length - 11] + " y " + sAWeeks[sAWeeks.Length - 1];
                
                //load ddl with Delitos' table
                ddlDelitos1.DataSource = new Base_Datos.dsSivicc2TableAdapters.DELITOSTableAdapter().GetDelitos();
                ddlDelitos1.DataTextField = "NOM_DELITO";
                ddlDelitos1.DataValueField = "NOM_DELITO";
                ddlDelitos1.DataBind();
                ddlDelitos1.Font.Size = 9;


                ddlDelitos2.DataSource = ddlDelitos1.DataSource;
                ddlDelitos2.DataTextField = "NOM_DELITO";
                ddlDelitos2.DataValueField = "NOM_DELITO";
                ddlDelitos2.DataBind();
                ddlDelitos2.Font.Size = 9;

                ddlDelitos3.DataSource = ddlDelitos1.DataSource;
                ddlDelitos3.DataTextField = "NOM_DELITO";
                ddlDelitos3.DataValueField = "NOM_DELITO";
                ddlDelitos3.DataBind();
                ddlDelitos3.Font.Size = 9;

                ddlContravenciones1.DataSource = new Base_Datos.dsSivicc2TableAdapters.CONTRAVENCIONESTableAdapter().GetContravenciones();
                ddlContravenciones1.DataTextField = "NOM_CONTRAVENCION";
                ddlContravenciones1.DataValueField = "NOM_CONTRAVENCION";
                ddlContravenciones1.DataBind();
                ddlContravenciones1.Font.Size = 8;

                ddlContravenciones2.DataSource = ddlContravenciones1.DataSource;
                ddlContravenciones2.DataTextField = "NOM_CONTRAVENCION";
                ddlContravenciones2.DataValueField = "NOM_CONTRAVENCION";
                ddlContravenciones2.DataBind();
                ddlContravenciones2.Font.Size = 8;

                ddlContravenciones3.DataSource = ddlContravenciones1.DataSource;
                ddlContravenciones3.DataTextField = "NOM_CONTRAVENCION";
                ddlContravenciones3.DataValueField = "NOM_CONTRAVENCION";
                ddlContravenciones3.DataBind();
                ddlContravenciones3.Font.Size = 8;



                //*****-----------Borrar cunado se tenga la tabla de los delitos de dijin-----------*******
                dtDatosPrueba = new DataTable();//new Base_Datos.dsSivicc2TableAdapters.V_HOJA_HOMICIDIOSTableAdapter().GetDelitosCuadrante(ddlCuadrantes.SelectedValue.ToString(), Convert.ToDecimal(ddlSemana.SelectedValue), Convert.ToDecimal(ddlYear.SelectedValue), Convert.ToDecimal(ddlSemana.SelectedValue), Convert.ToDecimal(ddlYear.SelectedValue));//new DataTable();
                dtDatosPrueba.Columns.Add("DELITO",typeof(int));
                dtDatosPrueba.Columns.Add("DELITO2", typeof(int));
                dtDatosPrueba.Columns.Add("DELITO3", typeof(int));

                for (int i = 0; i < 4; i++)
                {
                    drDatosPrueba = dtDatosPrueba.NewRow();
                    drDatosPrueba[0] = Convert.ToInt32((i) * 3 / 2);
                    drDatosPrueba[1] = Convert.ToInt32((i) * 4 / 2);
                    drDatosPrueba[2] = Convert.ToInt32((i) * 5 / 2);
                    dtDatosPrueba.Rows.Add(drDatosPrueba);

                }

            
                //Double dNumSem =ddlSemana.SelectedValue;
                dlDelitos1.DataSource = dtDatosPrueba;//new Base_Datos.dsSivicc2TableAdapters.V_HOJA_HOMICIDIOSTableAdapter().GetDelitosCuadrante(ddlCuadrantes.SelectedValue.ToString(), Convert.ToDecimal(sAWeeks[0]),Convert.ToDecimal(ddlYear.SelectedValue),Convert.ToDecimal(sAWeeks[sAWeeks.Length]),Convert.ToDecimal(ddlYear.SelectedValue));
                dlDelitos1.DataBind();
                dlDelitos2.DataSource = dtDatosPrueba;
                dlDelitos2.DataBind();
                dlDelitos3.DataSource = dtDatosPrueba;
                dlDelitos3.DataBind();
                
                dlContravenciones1.DataSource = dlDelitos1.DataSource;
                dlContravenciones1.DataBind();
                dlContravenciones2.DataSource = dlDelitos2.DataSource;
                dlContravenciones2.DataBind();
                dlContravenciones3.DataSource = dlDelitos3.DataSource;
                dlContravenciones3.DataBind();

                //---------***Borrar hasta qui***----------

                hfDelitos.Value = SetHiddenFieldDelitos();
                String[] sATotalsDelitos = sumDelito(hfDelitos.Value).Split(',');
                tboSumaDelitos1Cuadrante.Text = sATotalsDelitos[0];
                tboSumaDelitos2Cuadrante.Text = sATotalsDelitos[1];
                tboSumaDelitos3Cuadrante.Text = sATotalsDelitos[2];

                hfContravenciones.Value = SetHiddenFieldContravenciones();
                String[] sATotalsContravenciones = sumDelito(hfContravenciones.Value).Split(',');
                tboSumaContra1Cuadrante.Text = sATotalsContravenciones[0];
                tboSumaContra2Cuadrante.Text = sATotalsContravenciones[1];
                tboSumaContra3Cuadrante.Text = sATotalsContravenciones[2];

            }
        }

        protected string sumDelito(string s)
        {
            String[] sArrayValues = s.Split(',');
            int sum = 0;
            string sTotals = "";

            for (int i = 0; i < 4; i++) 
            {
                int iValue = Convert.ToInt32(sArrayValues[i]);
                sum += iValue;
            }
            sTotals = sum.ToString()+",";
            sum = 0;
            for(int i = 4; i < 8; i++)
            {
                
                int iValue = Convert.ToInt32(sArrayValues[i]);
                sum += iValue;
            }
            sTotals += sum.ToString()+",";
            sum = 0;
            for(int i = 8; i < 12; i++)
            {
                int iValue = Convert.ToInt32(sArrayValues[i]);
                sum += iValue;
            }
            sTotals += sum.ToString();

            return sTotals;
        }

        protected String SetHiddenFieldWeeks() 
        {
            int iItemDl = this.dlSemanasDelitos.Items.Count;
            String sValues = "";
            for (int i = 0; i < iItemDl; i++) 
            {
                Label idLabel = this.dlSemanasDelitos.Items[i].FindControl("lblSemanasDelitos") as Label;
                sValues += idLabel.Text + ", ";

            }
            return sValues;
        }

        protected String SetHiddenFieldDelitos() 
        {
            String sDelitos = "";
            int iItemDlDelitos = (this.dlDelitos1.Items.Count);
            for (int i = 0; i < iItemDlDelitos; i++)
            {
                Label labelDelitos1 = this.dlDelitos1.Items[i].FindControl("lblValDel1") as Label;
                sDelitos += labelDelitos1.Text + ",";
            }
            for(int i = 0; i < iItemDlDelitos; i++)
            {
                Label labelDelitos2 = this.dlDelitos2.Items[i].FindControl("lblValDel2") as Label;
                sDelitos += labelDelitos2.Text + ",";
            }
            for(int i = 0; i < iItemDlDelitos; i++)
            {
                Label labelDelitos3 = this.dlDelitos3.Items[i].FindControl("lblValDel3") as Label;
                sDelitos += labelDelitos3.Text + ",";
            }

            return sDelitos;
        }

        protected String SetHiddenFieldContravenciones()
        {
            String sContravenciones = "";
            int iItemDlContravenciones = (this.dlContravenciones1.Items.Count);
            for (int i = 0; i < iItemDlContravenciones; i++)
            {
                Label labelDelitos1 = this.dlContravenciones1.Items[i].FindControl("lblValContra1") as Label;
                sContravenciones += labelDelitos1.Text + ",";
            }
            for (int i = 0; i < iItemDlContravenciones; i++)
            {
                Label labelDelitos2 = this.dlContravenciones2.Items[i].FindControl("lblValContra2") as Label;
                sContravenciones += labelDelitos2.Text + ",";
            }
            for (int i = 0; i < iItemDlContravenciones; i++)
            {
                Label labelDelitos3 = this.dlContravenciones3.Items[i].FindControl("lblValContra3") as Label;
                sContravenciones += labelDelitos3.Text + ",";
            }

            return sContravenciones;
        }

        protected void ddlCuadrantes_SelectedIndexChanged(Object sender, EventArgs e)
        {
            hfCuadrante.Value = ddlCuadrantes.SelectedValue;

        }
        protected void Label_TextChanged(Object sender, EventArgs e)
        {
            int fourWeek = Convert.ToInt32(ddlSemana.SelectedValue) - 4;
            int beforWeek = Convert.ToInt32(ddlSemana.SelectedValue) - 1;
            lblSemanas.Text = "Estadísticas entre las semanas " + fourWeek.ToString() + " y " + beforWeek.ToString();

            lblEstadisticoDelincuencial.Text = "Análisis estadístico delincuencial por días entre las semanas " + fourWeek.ToString() + ", " +
                    (fourWeek +1).ToString() + ", " + (fourWeek +2).ToString() + ", " + (fourWeek +3).ToString();


        }

        protected void ddlSemana_SelectedIndexChanged(object sender, EventArgs e)
        {

            dtWeeks = new DataTable();
            int iNumWeek = Convert.ToInt32(ddlSemana.SelectedValue.ToString());
            int iYear = Convert.ToInt32(ddlYear.SelectedValue.ToString());
            String sWeeks = "";
            new Base_Datos.dsSivicc2TableAdapters.QueriesTableAdapter().LAST_4_WEEKS_YEAR(new Decimal(iNumWeek), new Decimal(iYear), out sWeeks);
            String[] sAWeeks = sWeeks.Split(',');



            dtWeeks.Columns.Add("NUM_SEM", typeof(String));


            for (int i = 1; i < sAWeeks.Length; i++)
            {
                drWeeks = dtWeeks.NewRow();
                drWeeks[0] = sAWeeks[i];
                dtWeeks.Rows.Add(drWeeks);
                i += 2;
            }

            dlSemanasDelitos.DataSource = dtWeeks;
            dlSemanasDelitos.DataBind();
            dlSemanasContravenciones.DataSource = dlSemanasDelitos.DataSource;
            dlSemanasContravenciones.DataBind();
            dlSemanasResultados.DataSource = dlSemanasDelitos.DataSource;
            dlSemanasResultados.DataBind();

            hfSemanas.Value = SetHiddenFieldWeeks();

            lblEstadisticoDelincuencial.Text = "Análisis estadístico delincuencial por días entrte " + sAWeeks[sAWeeks.Length - 12] + 
                " y " + sAWeeks[sAWeeks.Length - 3] +" comprendidas entre " + sAWeeks[sAWeeks.Length - 11] + " y " + 
                sAWeeks[sAWeeks.Length - 1];

            lblGeorreferenciacion.Text = "Georreferenciación de la actividad delictiva y ubicación de puntos críticos entre las semanas " + 
                sAWeeks[sAWeeks.Length - 12] + " y " + sAWeeks[sAWeeks.Length - 3] + " comprendidas entre " + 
                sAWeeks[sAWeeks.Length - 11] + " y " + sAWeeks[sAWeeks.Length - 1];

        }

        protected void dlSemanasDelitos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlDelito1Changed(object sender, EventArgs e) 
        {
            //Borrar cunado se tenga la tabla de los delitos de dijin
            dtDatosPrueba = new DataTable();
            dtDatosPrueba.Columns.Add("DELITO", typeof(int));

            for (int i = 0; i < 4; i++)
            {
                drDatosPrueba = dtDatosPrueba.NewRow();
                drDatosPrueba[0] = Convert.ToInt32(((i) * 3 / 2) + 1.5);
                dtDatosPrueba.Rows.Add(drDatosPrueba);
            }

            dlDelitos1.DataSource = dtDatosPrueba;
            dlDelitos1.DataBind();
            //---***Hasta aqui borrar***---

            hfDelitos.Value = SetHiddenFieldDelitos();

            String[] sATotalsDelitos = sumDelito(hfDelitos.Value).Split(',');
            tboSumaDelitos1Cuadrante.Text = sATotalsDelitos[0];

        }

        protected void ddlDelito2Changed(object sender, EventArgs e)
        {
            //Borrar cunado se tenga la tabla de los delitos de dijin
            dtDatosPrueba = new DataTable();
            dtDatosPrueba.Columns.Add("DELITO2", typeof(int));

            for (int i = 0; i < 4; i++)
            {
                drDatosPrueba = dtDatosPrueba.NewRow();
                drDatosPrueba[0] = Convert.ToInt32(((i) * 3 / 2) + 2.5);
                dtDatosPrueba.Rows.Add(drDatosPrueba);
            }

            dlDelitos2.DataSource = dtDatosPrueba;
            dlDelitos2.DataBind();
            //---***Hasta aqui borrar***---

            hfDelitos.Value = SetHiddenFieldDelitos();

            String[] sATotalsDelitos = sumDelito(hfDelitos.Value).Split(',');
            tboSumaDelitos2Cuadrante.Text = sATotalsDelitos[1];
        }

        protected void ddlDelito3Changed(object sender, EventArgs e)
        {
            //Borrar cunado se tenga la tabla de los delitos de dijin
            dtDatosPrueba = new DataTable();
            dtDatosPrueba.Columns.Add("DELITO3", typeof(int));

            for (int i = 0; i < 4; i++)
            {
                drDatosPrueba = dtDatosPrueba.NewRow();
                drDatosPrueba[0] = Convert.ToInt32(((i) * 3 / 2) + 3.5);
                dtDatosPrueba.Rows.Add(drDatosPrueba);
            }

            dlDelitos3.DataSource = dtDatosPrueba;
            dlDelitos3.DataBind();
            //---***Hasta aqui borrar***---

            hfDelitos.Value = SetHiddenFieldDelitos();

            String[] sATotalsDelitos = sumDelito(hfDelitos.Value).Split(',');
            tboSumaDelitos3Cuadrante.Text = sATotalsDelitos[2];
        }

        protected void ddContrevencion1Changed(object sender, EventArgs e) 
        {
            dtDatosPrueba = new DataTable();
            dtDatosPrueba.Columns.Add("DELITO", typeof(int));

            for (int i = 0; i < 4; i++)
            {
                drDatosPrueba = dtDatosPrueba.NewRow();
                drDatosPrueba[0] = Convert.ToInt32(((i) * 3 / 2) + 4.5);
                dtDatosPrueba.Rows.Add(drDatosPrueba);
            }

            dlContravenciones1.DataSource = dtDatosPrueba;
            dlContravenciones1.DataBind();

            hfContravenciones.Value = SetHiddenFieldContravenciones();

            String[] sATotalsContravenciones = sumDelito(hfContravenciones.Value).Split(',');
            tboSumaContra1Cuadrante.Text = sATotalsContravenciones[0];

        }

        protected void ddContrevencion2Changed(object sender, EventArgs e)
        {
            dtDatosPrueba = new DataTable();
            dtDatosPrueba.Columns.Add("DELITO2", typeof(int));

            for (int i = 0; i < 4; i++)
            {
                drDatosPrueba = dtDatosPrueba.NewRow();
                drDatosPrueba[0] = Convert.ToInt32(((i) * 3 / 2) + 5.5);
                dtDatosPrueba.Rows.Add(drDatosPrueba);
            }

            dlContravenciones2.DataSource = dtDatosPrueba;
            dlContravenciones2.DataBind();

            hfContravenciones.Value = SetHiddenFieldContravenciones();

            String[] sATotalsContravenciones = sumDelito(hfContravenciones.Value).Split(',');
            tboSumaContra2Cuadrante.Text = sATotalsContravenciones[1];
        }

        protected void ddContrevencion3Changed(object sender, EventArgs e)
        {
            dtDatosPrueba = new DataTable();
            dtDatosPrueba.Columns.Add("DELITO3", typeof(int));

            for (int i = 0; i < 4; i++)
            {
                drDatosPrueba = dtDatosPrueba.NewRow();
                drDatosPrueba[0] = Convert.ToInt32(((i) * 3 / 2) + 6.5);
                dtDatosPrueba.Rows.Add(drDatosPrueba);
            }

            dlContravenciones3.DataSource = dtDatosPrueba;
            dlContravenciones3.DataBind();

            hfContravenciones.Value = SetHiddenFieldContravenciones();

            String[] sATotalsContravenciones = sumDelito(hfContravenciones.Value).Split(',');
            tboSumaContra3Cuadrante.Text = sATotalsContravenciones[2];
        }

        
    }
}