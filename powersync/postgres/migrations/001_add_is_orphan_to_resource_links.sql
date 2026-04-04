-- Migration: Add is_orphan column to resource_links if not exists
-- This is needed for the orphan resource cleanup scheduler

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'resource_links' AND column_name = 'is_orphan'
    ) THEN
        ALTER TABLE resource_links ADD COLUMN is_orphan BOOLEAN NOT NULL DEFAULT FALSE;
    END IF;
END $$;

-- Index for efficient orphan resource queries
CREATE INDEX IF NOT EXISTS idx_resource_links_is_orphan ON resource_links (is_orphan)
WHERE
    is_orphan = TRUE;