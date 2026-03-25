import { Router, Request, Response } from 'express';
import { upload } from '../lib/cloudinary';
import { authMiddleware } from '../middleware/auth';

const router = Router();

// POST /api/upload — admin uniquement
router.post('/', authMiddleware, upload.single('file'), (req: Request, res: Response): void => {
  if (!req.file) {
    res.status(400).json({ message: 'Aucun fichier reçu' });
    return;
  }
  const url = (req.file as any).path;
  res.json({ url });
});

export default router;
