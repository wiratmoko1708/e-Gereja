<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Data Jemaat - {{ $jemaat->nama }}</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 20px;
            font-size: 14px;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
            border-bottom: 2px solid #000;
            padding-bottom: 10px;
        }
        .header img {
            height: 80px;
            margin-right: 20px;
        }
        .header-text {
            text-align: center;
            flex-grow: 1;
        }
        .header h1 { 
            margin: 0; 
            font-size: 24px; 
        }
        .header p { 
            margin: 5px 0 0; 
            font-size: 14px; 
        }
        .content {
            margin-top: 30px;
        }
        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
            border-bottom: 1px solid #ccc;
            padding-bottom: 5px;
        }
        .data-table {
            width: 100%;
            margin-bottom: 20px;
        }
        .data-row {
            display: flex;
            margin-bottom: 12px;
        }
        .data-label {
            width: 200px;
            font-weight: bold;
            color: #555;
        }
        .data-value {
            flex: 1;
            color: #000;
        }
        .footer { 
            margin-top: 50px; 
            text-align: right; 
            font-size: 12px; 
            color: #666;
        }
        @media print {
            body { margin: 15px; }
            .no-print { display: none; }
        }
    </style>
</head>
<body onload="window.print()">

    <div class="header">
        <div style="display: flex; align-items: center;">
            @if(isset($profil) && $profil->logo)
                <img src="{{ asset('storage/' . $profil->logo) }}" alt="Logo">
            @endif
        </div>
        <div class="header-text" style="text-align: center; width: 100%;">
            <h1>{{ $profil->nama_gereja ?? 'Gereja Ajaib Benar Anugerah' }}</h1>
            <p>Data Jemaat</p>
            <p>Tanggal Cetak: {{ now()->locale('id')->translatedFormat('d F Y') }}</p>
        </div>
        <div style="width: 80px;"></div>
    </div>

    <div class="content">
        <div class="section-title">Informasi Jemaat</div>
        
        <div class="data-table">
            <div class="data-row">
                <div class="data-label">Nama Lengkap</div>
                <div class="data-value">: {{ $jemaat->nama }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">Tempat Lahir</div>
                <div class="data-value">: {{ $jemaat->tempat_lahir ?? '-' }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">Tanggal Lahir</div>
                <div class="data-value">: {{ $jemaat->tanggal_lahir ? $jemaat->tanggal_lahir->locale('id')->translatedFormat('d F Y') : '-' }}</div>
            </div>
            
            @if($jemaat->tanggal_lahir)
            <div class="data-row">
                <div class="data-label">Usia</div>
                <div class="data-value">: {{ $jemaat->usia }} tahun</div>
            </div>
            @endif
            
            <div class="data-row">
                <div class="data-label">Jenis Kelamin</div>
                <div class="data-value">: {{ $jemaat->jenis_kelamin == 'L' ? 'Laki-laki' : 'Perempuan' }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">Alamat</div>
                <div class="data-value">: {{ $jemaat->alamat ?? '-' }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">No Telepon</div>
                <div class="data-value">: {{ $jemaat->no_telepon ?? '-' }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">Email</div>
                <div class="data-value">: {{ $jemaat->email ?? '-' }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">Status Pernikahan</div>
                <div class="data-value">: {{ $jemaat->status_pernikahan ?? '-' }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">Pekerjaan</div>
                <div class="data-value">: {{ $jemaat->pekerjaan ?? '-' }}</div>
            </div>
            
            <div class="data-row">
                <div class="data-label">Komsel</div>
                <div class="data-value">: {{ $jemaat->komsel->nama_komsel ?? '-' }}</div>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>Dicetak oleh: {{ auth()->user()->name ?? 'Admin' }}</p>
        <p>{{ now()->locale('id')->translatedFormat('d F Y, H:i') }} WIB</p>
    </div>

</body>
</html>
