import { useCallback, useMemo, useState } from 'react'
import { useDropzone } from 'react-dropzone'
import { Upload, X } from 'lucide-react'

import { Button } from '../lib/shadcn/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../lib/shadcn/card'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '../lib/shadcn/table'
import { cn } from '../lib/shadcn/utils'

type SelectedFile = {
  id: string
  file: File
}

function formatFileSize(bytes: number) {
  const kilobytes = bytes / 1024

  if (kilobytes < 1024) {
    return `${kilobytes.toFixed(kilobytes >= 10 ? 1 : 2)} KB`
  }

  return `${(kilobytes / 1024).toFixed(2)} MB`
}

function getFileId(file: File) {
  return `${file.name}-${file.size}-${file.lastModified}-${crypto.randomUUID()}`
}

export default function FileUploadPage() {
  const [selectedFiles, setSelectedFiles] = useState<SelectedFile[]>([])

  const onDrop = useCallback((acceptedFiles: File[]) => {
    setSelectedFiles((currentFiles) => [
      ...currentFiles,
      ...acceptedFiles.map((file) => ({ id: getFileId(file), file })),
    ])
  }, [])

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    multiple: true,
  })

  const totalSize = useMemo(
    () => selectedFiles.reduce((sum, item) => sum + item.file.size, 0),
    [selectedFiles]
  )

  const removeFile = (id: string) => {
    setSelectedFiles((currentFiles) => currentFiles.filter((item) => item.id !== id))
  }

  const clearAllFiles = () => {
    setSelectedFiles([])
  }

  return (
    <main className="min-h-screen bg-background px-4 py-10 text-foreground sm:px-6 lg:px-8">
      <section className="mx-auto flex w-full max-w-5xl flex-col gap-6">
        <div className="space-y-2">
          <h1 className="text-3xl font-semibold tracking-tight">File uploader!</h1>
          <p className="text-muted-foreground">Drag files into the upload area or browse from your device.</p>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Upload files</CardTitle>
            <CardDescription>Any file type is accepted. Selected files appear in the table below.</CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div
              {...getRootProps({
                className: cn(
                  'flex min-h-48 cursor-pointer flex-col items-center justify-center rounded-lg border border-dashed border-border bg-muted/30 p-8 text-center transition-colors hover:bg-accent focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
                  isDragActive && 'border-primary bg-primary/10'
                ),
              })}
            >
              <input {...getInputProps()} />
              <Upload className="mb-4 h-10 w-10 text-muted-foreground" aria-hidden="true" />
              <p className="text-base font-medium">Drag files here or click to upload</p>
            </div>

            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <p className="text-sm text-muted-foreground">
                {selectedFiles.length} {selectedFiles.length === 1 ? 'file' : 'files'} selected
                {selectedFiles.length > 0 ? ` · ${formatFileSize(totalSize)} total` : ''}
              </p>
              <div className="flex gap-2">
                <Button variant="outline" onClick={clearAllFiles} disabled={selectedFiles.length === 0}>
                  Clear all
                </Button>
                <Button disabled={selectedFiles.length === 0}>Upload</Button>
              </div>
            </div>

            <div className="rounded-lg border">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>File name</TableHead>
                    <TableHead>Size</TableHead>
                    <TableHead>Type</TableHead>
                    <TableHead className="text-right">Remove</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {selectedFiles.length === 0 ? (
                    <TableRow>
                      <TableCell colSpan={4} className="h-24 text-center text-muted-foreground">
                        No files selected.
                      </TableCell>
                    </TableRow>
                  ) : (
                    selectedFiles.map((item) => (
                      <TableRow key={item.id}>
                        <TableCell className="max-w-96 truncate font-medium">{item.file.name}</TableCell>
                        <TableCell>{formatFileSize(item.file.size)}</TableCell>
                        <TableCell>{item.file.type || 'Unknown'}</TableCell>
                        <TableCell className="text-right">
                          <Button
                            variant="ghost"
                            size="sm"
                            onClick={() => removeFile(item.id)}
                            aria-label={`Remove ${item.file.name}`}
                          >
                            <X className="h-4 w-4" />
                            Remove
                          </Button>
                        </TableCell>
                      </TableRow>
                    ))
                  )}
                </TableBody>
              </Table>
            </div>
          </CardContent>
        </Card>
      </section>
    </main>
  )
}
