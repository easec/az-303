# Kommer att lägga till fyra stycken poster

function Add-Entity() { 
   [CmdletBinding()] 
	
   param( 
      $table, 
      [String]$partitionKey, 
      [String]$rowKey, 
      [String]$title, 
      [Int]$id, 
      [String]$publisher, 
      [String]$author 
   )  
   
   $entity = New-Object -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity -ArgumentList $partitionKey, $rowKey 
		
   $entity.Properties.Add("Title", $title) 
   $entity.Properties.Add("ID", $id) 
   $entity.Properties.Add("Publisher", $publisher) 
   $entity.Properties.Add("Author", $author) 
   
   
   $result = $table.CloudTable.Execute(
      [Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($entity)) 
}

# $StorageAccountName = "easecbook" 
# $StorageAccountKey = Get-AzureStorageKey -StorageAccountName $StorageAccountName 


$StorageAccountName = "easecbook" 
$StorageAccountKey = "<storagekey>" 
$Ctx = New-AzureStorageContext $StorageAccountName -StorageAccountKey $StorageAccountKey  

$TableName = "easecbooks"
  
$table = Get-AzureStorageTable –Name $TableName -Context $Ctx -ErrorAction Ignore 
 
#Add multiple entities to a table. 
Add-Entity -Table $table -PartitionKey Partition1 -RowKey Row1 -Title 'The Dream Achitects' -Id 1 -Publisher 'Grand Central Publishing' -Author 'David Polfeldt' 
Add-Entity -Table $table -PartitionKey Partition2 -RowKey Row2 -Title 'The Phoenix Project' -Id 2 -Publisher 'IT Revolution' -Author 'Kim, Behr and Spafford' 
Add-Entity -Table $table -PartitionKey Partition3 -RowKey Row3 -Title 'Drive' -Id 3 -Publisher 'Canongate' -Author 'Daniel H. Pink' 
Add-Entity -Table $table -PartitionKey Partition4 -RowKey Row4 -Title 'When' -Id 4 -Publisher 'Canongate' -Author 'Daniel H. Pink'
