# Kommer att inhämtaposter från table


$StorageAccountName = "easecbook" 


$TableName = "easecbooks"
  
#Get a reference to a table. 
$table = Get-AzureStorageTable –Name $TableName -Context $Ctx  

#Create a table query. 
$query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery

#Define columns to select. 
$list = New-Object System.Collections.Generic.List[string] 
$list.Add("RowKey") 
$list.Add("ID") 
$list.Add("Title") 
$list.Add("Publisher") 
$list.Add("Author")
  
#Set query details. 
$query.FilterString = "ID gt 0" 
$query.SelectColumns = $list 
$query.TakeCount = 20
 
#Execute the query. 
$entities = $table.CloudTable.ExecuteQuery($query)

#Display entity properties with the table format. 

$entities  | Format-Table PartitionKey, RowKey, @{ Label = "Title"; Expression={$_.Properties["Title"].StringValue}}, @{ Label = "ID"; Expression={$_.Properties[“ID”].Int32Value}}, @{ Label = "Publisher"; Expression={$_.Properties[“Publisher”].StringValue}}, @{ Label = "Author"; Expression={$_.Properties[“Author”].StringValue}} -AutoSize 
