<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Daftar Pelayanan</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
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
        .header h1 { margin: 0; font-size: 24px; }
        .header p { margin: 5px 0 0; font-size: 14px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 12px; }
        th, td { border: 1px solid #000; padding: 6px; text-align: left; }
        th { background-color: #f2f2f2; }
        .footer { margin-top: 30px; text-align: right; font-size: 12px; }
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
            <p>Laporan daftar Pelayanan</p>
            <p>Tanggal Cetak: {{ now()->locale('id')->translatedFormat('d F Y') }}</p>
        </div>
        <div style="width: 80px;"></div>
    </div>

    <table>
        <thead>
            <tr>
                <th style="width: 5%">No</th>
                <th>Tanggal</th>
                <th>Ibadah</th>
                <th>Pelayan</th>
                <th>Talenta</th>
                <th>Keterangan</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $index => $item)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $item->tanggal->format('d/m/Y') }}</td>
                <td>{{ $item->jadwalIbadah->nama_ibadah ?? '-' }}</td>
                <td>{{ $item->jemaat->nama ?? '-' }}</td>
                <td>{{ $item->talenta->nama_talenta ?? '-' }}</td>
                <td>{{ $item->keterangan }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div class="footer">
        <p>Dicetak oleh: {{ auth()->user()->name ?? 'Admin' }}</p>
    </div>

</body>
</html>
