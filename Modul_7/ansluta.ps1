# Ansluter till storageaccount, skapar table och inhämtar table


$StorageAccountName = "easecbook" 
$StorageAccountKey = "<storage_key>" 
$Ctx = New-AzureStorageContext $StorageAccountName -StorageAccountKey $StorageAccountKey


$tabName = "easecbooks" 
New-AzureStorageTable –Name $tabName –Context $Ctx
