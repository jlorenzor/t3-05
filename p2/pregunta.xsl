<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Datos de Vehículos Eléctricos</title>
        <style>
          .filters {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 15px;
            padding: 20px;
            background: #f5f5f5;
            border-radius: 8px;
            margin-bottom: 20px;
          }
          .filter-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
          }
          .filter-group label {
            font-weight: bold;
            font-size: 14px;
          }
          .filter-group input, .filter-group select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
          }
          .table-container {
            max-height: 70vh;
            overflow-y: auto;
            margin-top: 20px;
          }
          table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
          }
          th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            font-size: 14px;
          }
          th {
            background-color: #4CAF50;
            color: white;
            position: sticky;
            top: 0;
            z-index: 10;
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
          tr:hover {
            background-color: #ddd;
          }
        </style>
        <script>
          <![CDATA[
          function applyFilters() {
            const filters = {
              vin: document.getElementById('vinFilter').value.toLowerCase(),
              county: document.getElementById('countyFilter').value.toLowerCase(),
              city: document.getElementById('cityFilter').value.toLowerCase(),
              state: document.getElementById('stateFilter').value.toLowerCase(),
              zipCode: document.getElementById('zipCodeFilter').value.toLowerCase(),
              modelYear: document.getElementById('modelYearFilter').value.toLowerCase(),
              make: document.getElementById('makeFilter').value.toLowerCase(),
              model: document.getElementById('modelFilter').value.toLowerCase(),
              evType: document.getElementById('evTypeFilter').value.toLowerCase(),
              cafvType: document.getElementById('cafvTypeFilter').value.toLowerCase(),
              electricRange: document.getElementById('electricRangeFilter').value.toLowerCase(),
              baseMsrp: document.getElementById('baseMsrpFilter').value.toLowerCase(),
              legislativeDistrict: document.getElementById('legislativeDistrictFilter').value.toLowerCase(),
              dolVehicleId: document.getElementById('dolVehicleIdFilter').value.toLowerCase(),
              location: document.getElementById('locationFilter').value.toLowerCase(),
              electricUtility: document.getElementById('electricUtilityFilter').value.toLowerCase(),
              censusTract: document.getElementById('censusTractFilter').value.toLowerCase()
            };
            
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach(row => {
              const visible = Object.keys(filters).every((key, index) => {
                const cellText = row.cells[index].textContent.toLowerCase();
                return !filters[key] || cellText.includes(filters[key]);
              });
              
              row.style.display = visible ? '' : 'none';
            });
          }
          ]]>
        </script>
      </head>
      <body>
        <h1>Datos de Vehículos Eléctricos</h1>
        
        <div class="filters">
          <div class="filter-group">
            <label for="vinFilter">VIN (1-10):</label>
            <input type="text" id="vinFilter" onkeyup="applyFilters()" placeholder="Filtrar por VIN"/>
          </div>
          <div class="filter-group">
            <label for="countyFilter">County:</label>
            <input type="text" id="countyFilter" onkeyup="applyFilters()" placeholder="Filtrar por county"/>
          </div>
          <div class="filter-group">
            <label for="cityFilter">City:</label>
            <input type="text" id="cityFilter" onkeyup="applyFilters()" placeholder="Filtrar por city"/>
          </div>
          <div class="filter-group">
            <label for="stateFilter">State:</label>
            <input type="text" id="stateFilter" onkeyup="applyFilters()" placeholder="Filtrar por state"/>
          </div>
          <div class="filter-group">
            <label for="zipCodeFilter">Postal Code:</label>
            <input type="text" id="zipCodeFilter" onkeyup="applyFilters()" placeholder="Filtrar por código postal"/>
          </div>
          <div class="filter-group">
            <label for="modelYearFilter">Model Year:</label>
            <input type="text" id="modelYearFilter" onkeyup="applyFilters()" placeholder="Filtrar por año"/>
          </div>
          <div class="filter-group">
            <label for="makeFilter">Make:</label>
            <input type="text" id="makeFilter" onkeyup="applyFilters()" placeholder="Filtrar por marca"/>
          </div>
          <div class="filter-group">
            <label for="modelFilter">Model:</label>
            <input type="text" id="modelFilter" onkeyup="applyFilters()" placeholder="Filtrar por modelo"/>
          </div>
          <div class="filter-group">
            <label for="evTypeFilter">EV Type:</label>
            <input type="text" id="evTypeFilter" onkeyup="applyFilters()" placeholder="Filtrar por tipo EV"/>
          </div>
          <div class="filter-group">
            <label for="cafvTypeFilter">CAFV Type:</label>
            <input type="text" id="cafvTypeFilter" onkeyup="applyFilters()" placeholder="Filtrar por CAFV"/>
          </div>
          <div class="filter-group">
            <label for="electricRangeFilter">Electric Range:</label>
            <input type="text" id="electricRangeFilter" onkeyup="applyFilters()" placeholder="Filtrar por rango"/>
          </div>
          <div class="filter-group">
            <label for="baseMsrpFilter">Base MSRP:</label>
            <input type="text" id="baseMsrpFilter" onkeyup="applyFilters()" placeholder="Filtrar por MSRP"/>
          </div>
          <div class="filter-group">
            <label for="legislativeDistrictFilter">Legislative District:</label>
            <input type="text" id="legislativeDistrictFilter" onkeyup="applyFilters()" placeholder="Filtrar por distrito"/>
          </div>
          <div class="filter-group">
            <label for="dolVehicleIdFilter">DOL Vehicle ID:</label>
            <input type="text" id="dolVehicleIdFilter" onkeyup="applyFilters()" placeholder="Filtrar por ID"/>
          </div>
          <div class="filter-group">
            <label for="locationFilter">Vehicle Location:</label>
            <input type="text" id="locationFilter" onkeyup="applyFilters()" placeholder="Filtrar por ubicación"/>
          </div>
          <div class="filter-group">
            <label for="electricUtilityFilter">Electric Utility:</label>
            <input type="text" id="electricUtilityFilter" onkeyup="applyFilters()" placeholder="Filtrar por utility"/>
          </div>
          <div class="filter-group">
            <label for="censusTractFilter">Census Tract:</label>
            <input type="text" id="censusTractFilter" onkeyup="applyFilters()" placeholder="Filtrar por census"/>
          </div>
        </div>

        <div class="table-container">
          <table>
            <thead>
              <tr>
                <th>VIN (1-10)</th>
                <th>County</th>
                <th>City</th>
                <th>State</th>
                <th>Postal Code</th>
                <th>Model Year</th>
                <th>Make</th>
                <th>Model</th>
                <th>EV Type</th>
                <th>CAFV Type</th>
                <th>Electric Range</th>
                <th>Base MSRP</th>
                <th>Legislative District</th>
                <th>DOL Vehicle ID</th>
                <th>Vehicle Location</th>
                <th>Electric Utility</th>
                <th>Census Tract</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="response/row/row">
                <tr>
                  <td><xsl:value-of select="vin_1_10"/></td>
                  <td><xsl:value-of select="county"/></td>
                  <td><xsl:value-of select="city"/></td>
                  <td><xsl:value-of select="state"/></td>
                  <td><xsl:value-of select="zip_code"/></td>
                  <td><xsl:value-of select="model_year"/></td>
                  <td><xsl:value-of select="make"/></td>
                  <td><xsl:value-of select="model"/></td>
                  <td><xsl:value-of select="ev_type"/></td>
                  <td><xsl:value-of select="cafv_type"/></td>
                  <td><xsl:value-of select="electric_range"/></td>
                  <td><xsl:value-of select="base_msrp"/></td>
                  <td><xsl:value-of select="legislative_district"/></td>
                  <td><xsl:value-of select="dol_vehicle_id"/></td>
                  <td><xsl:value-of select="geocoded_column"/></td>
                  <td><xsl:value-of select="electric_utility"/></td>
                  <td><xsl:value-of select="_2020_census_tract"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
